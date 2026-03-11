class Booking < ApplicationRecord
  belongs_to :customer, class_name: "User",  foreign_key: "customer_id"
  belongs_to :event
  has_one :chat_room, dependent: :destroy

  after_create :create_chat_room

  validates :seat_number, numericality: true
  validates :seat_number, presence: true

  private 
  def create_chat_room
    ChatRoom.create(booking: self)
  end
end
