class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_date
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.integer :duration

      t.timestamps
    end
  end
end
