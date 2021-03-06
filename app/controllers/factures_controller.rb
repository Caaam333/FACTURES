class FacturesController < ApplicationController
  
  def index
    # @factures = Facture.all
    
    @factures_sold = Facture.where(sold: "true").order(created_at: :desc).limit(3)
    @factures_not_sold = Facture.where(sold: "false").order(created_at: :desc)
  end

  def show
    @facture = Facture.find(params[:id])
  end

  def new
    @facture = Facture.new(params[:facture])
    # @facture.recipient_id = params[:recipient_id]
    # @recipient = Recipient.find(params[:recipient_id])
  end

  def create
    @facture = Facture.new(facture_params)
    # @recipient = Recipient.find(params[:recipient_id])
    # @facture.recipient = @recipient
    # @facture.save

    if @facture.save
      redirect_to facture_path(@facture)
    else
      render "new"
    end
  end

  def edit
    @facture = Facture.find(params[:id])
  end

  def update
    @facture = Facture.find(params[:id])
    @facture.update(facture_params)

    redirect_to facture_path(@facture)
  end

  def destroy
    @facture = Facture.find(params[:id])
    @facture.destroy

    redirect_to root_path
  end

  private

  def facture_params
    params.require(:facture).permit(:recipient_id, :id, :price, :limite, :sold)
  end

end
