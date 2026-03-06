class Otp < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :otp, length: { is: 5 }, numericality: { only_integer: true }, presence: true
end
