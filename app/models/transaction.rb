class Transaction < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :merchant
  belongs_to :terminal
  belongs_to :card

  validates :amount_cents, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: %w[pending completed failed refunded] }

end
