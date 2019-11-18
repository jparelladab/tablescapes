class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :tablescape, foreign_key: true
      t.date :date_from
      t.date :date_to
      t.integer :total_price
      t.integer :attendees

      t.timestamps
    end
  end
end
