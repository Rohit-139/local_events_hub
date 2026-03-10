class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :events, through: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   validates :name,:type, presence: true
   
end
