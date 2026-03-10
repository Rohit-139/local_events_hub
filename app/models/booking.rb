class Booking < ApplicationRecord
  belongs_to :customer, class_name: "User",  foreign_key: "customer_id"
  belongs_to :event

  validates :seat_number, numericality: true
  validates :seat_number, presence: true
end
