class Passenger < ApplicationRecord
  has_many :flights
  has_many :bookings
end
