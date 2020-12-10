class CreateReturns < ActiveRecord::Migration[6.0]
  def change
    create_table :returns do |t|
      t.datetime :return_datetime
      t.integer :device_id
      t.string :return_staff
      t.integer :department_id
      t.timestamps
    end
  end
end
