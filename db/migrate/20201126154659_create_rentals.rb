class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.date :loan_date
      t.date :return_date
      t.integer :device_id
      t.string :rental_staff
      t.string :return_staff
      t.integer :days
      t.timestamps
    end
  end
end
