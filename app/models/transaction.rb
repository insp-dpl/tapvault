class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  belongs_to :terminal
  belongs_to :card
end
