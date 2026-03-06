class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :seat_number, numericality: true
  validates :seat_number, presence: true
end
