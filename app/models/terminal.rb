class Terminal < ApplicationRecord
  belongs_to :merchant

  validates :device_identifier, presence: true, uniqueness: true
  validates :status, inclusion: { in: %w[active inactive] }
end
