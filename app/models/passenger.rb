class Passenger < ApplicationRecord
  has_many :flights
  belongs_to :booking
end
