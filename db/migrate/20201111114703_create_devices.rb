class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.integer :device_class
      t.string :name
      t.string :model_number #型番
      t.string :serial_number #sn
      t.date :purchase_date
      t.date :price
      t.date :last_inspection_date
      t.date :next_inspection_date
      t.date :inspection_interval
      t.boolean :lending_status
      t.timestamps
    end
  end
end
