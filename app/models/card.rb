class Card < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :transactions, dependent: :nullify

  validates :uid, presence: true, uniqueness: true
end
