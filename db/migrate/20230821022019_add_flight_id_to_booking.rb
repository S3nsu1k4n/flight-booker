class AddFlightIdToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :flight_id, :integer
  end
end
