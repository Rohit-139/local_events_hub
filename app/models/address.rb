class Address < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: "customer_id" 
  validates :street, :city, :state, presence: true
  validates :customer_id, uniqueness: true

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

end
