class Customer < User
      has_one :address, dependent: :destroy, foreign_key: "customer_id"
      has_many :bookings, dependent: :destroy, foreign_key: "customer_id"
      validates :otp, length: { is: 5 }, numericality: { only_integer: true }

end