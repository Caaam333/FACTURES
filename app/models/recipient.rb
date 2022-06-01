class Recipient < ApplicationRecord
  has_many :factures, dependent: :destroy
end
