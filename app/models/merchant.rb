class Merchant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :terminals, dependent: :destroy
  has_many :transactions, through: :terminals

  validates :business_name, presence: true
  validates :approval_status, inclusion: { in: ['pending', 'approved', 'rejected'] }

  def approved?
    approval_status == 'approved'
  end
end
