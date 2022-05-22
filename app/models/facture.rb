class Facture < ApplicationRecord
  belongs_to :recipient

  # attr_accessor :recipient_id
end
