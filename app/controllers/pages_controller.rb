class PagesController < ApplicationController
  def home
    @factures = Facture.all
    @recipients = Recipient.all
  end
end
