class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.datetime :loan_datetime
      t.integer :device_id
      t.string :rental_staff
      t.integer :department_id
      t.timestamps
    end
  end
end
