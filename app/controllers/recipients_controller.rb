class RecipientsController < ApplicationController
  def index
    @recipients = Recipient.all
  end
  def show
    @recipient = Recipient.find(params[:id])
  end
  
  def new
    @recipient = Recipient.new
  end
  
  def create
    @recipient = Recipient.new(recipient_params)
  
    if @recipient.save
      redirect_to recipient_path(@recipient)
    else
      render "new"
    end
  end
  
  def edit
    @recipient = Recipient.find(params[:id])
  end

  def update
    @recipient = Recipient.find(params[:id])
    @recipient.update(recipient_params)

    redirect_to recipient_path(@recipient)
  end
  
  def destroy
    @recipient = Recipient.find(params[:id])
    @recipient.destroy
  
    redirect_to recipients_path
  end
  
  private
  
  def recipient_params
    params.require(:recipient).permit(:name, :id, :description)
  end
  
end


