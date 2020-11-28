class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.datetime :loan_datetime
      t.datetime :return_datetime
      t.integer :device_id
      t.string :rental_staff
      t.string :return_staff
      t.integer :department_id
      t.integer :days
      t.timestamps
    end
  end
end
