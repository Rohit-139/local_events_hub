class Event < ApplicationRecord
  has_one_attached :image
  has_many :bookings 
  has_many :users, through: :bookings

  validates :name, :description, :total_seat, :ticket_price, :street, :city, :state, presence: true
    validates :total_seat, numericality: {
    greater_than_or_equal_to: 10,
    less_than_or_equal_to: 5000
  }
   validates :ticket_price, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10000
  }
   geocoded_by :address do |object, results|
    if results.present?
      object.latitude = results.first.latitude
      object.longitude = results.first.longitude
    else
      object.latitude = nil
      object.longitude = nil
    end
  end

  before_validation :geocode, if: :address_changed?
  validate :found_address_presence
  before_create :set_available_seat

  def address
    [ street, city, state ].compact.join(", ")
  end

  def address_changed?
    street_changed? || city_changed? || state_changed?
  end

  private

  def found_address_presence
    if latitude.blank? || longitude.blank?
      errors.add(:address, "We couldn't find the exact location for the provided address")
    end
  end

  def set_available_seat
  self.available_seat ||= total_seat
end



 
end
