class FacturesController < ApplicationController
  
  def index
    @factures = Facture.all
  end

  def show
    @facture = Facture.find(params[:id])
  end

  def new
    @facture = Facture.new
    # @facture.recipient_id = params[:recipient_id]
    @recipient = Recipient.find(params[:recipient_id])
  end

  def create
    @facture = Facture.new(facture_params)
    @recipient = Recipient.find(params[:recipient_id])
    @facture.recipient = @recipient

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

    redirect_to factures_path
  end

  private

  def facture_params
    params.require(:facture).permit(:recipient_id, :price, :limite, :sold)
  end
end
