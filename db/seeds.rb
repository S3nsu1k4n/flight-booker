# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all
Flight.destroy_all

10.times do
  Airport.create(code: SecureRandom.send(:choose, [*'A'..'Z'], 3))
end

p "Created #{Airport.count} airport codes"

airport_ids = Airport.ids
500.times do
  departure_id = SecureRandom.send(:choose, airport_ids, 1).to_i
  arrival_id = SecureRandom.send(:choose, airport_ids - [departure_id], 1).to_i
  date = Date.today + SecureRandom.random_number(7).days
  duration_hours = SecureRandom.random_number(23) + 1
  Flight.create(departure_airport_id:departure_id, arrival_airport_id: arrival_id, departure_date: date, duration: duration_hours)
end

p "Created #{Flight.count} flights"
