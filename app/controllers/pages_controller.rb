class PagesController < ApplicationController
  def home
    # @factures = Facture.all
    @recipients = Recipient.all
    @factures_sold = Facture.where(sold: "true").order(created_at: :desc).limit(2)
    @factures_not_sold = Facture.where(sold: "false").order(created_at: :desc)
  end
end
