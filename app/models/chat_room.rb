class ChatRoom < ApplicationRecord
  belongs_to :booking
  has_many :messages, dependent: :destroy

  def users
    [booking.customer, booking.event.admin]
  end
end
