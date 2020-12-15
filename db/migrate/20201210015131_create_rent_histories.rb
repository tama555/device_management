class CreateRentHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :rent_histories do |t|
      t.datetime :loan_datetime
      t.datetime :return_datetime
      t.integer :device_id
      t.string :rental_staff
      t.string :return_staff
      t.string :rental_department
      t.string :return_department
      t.integer :day
      t.timestamps
    end
  end
end
