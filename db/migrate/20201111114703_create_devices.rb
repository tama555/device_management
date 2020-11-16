class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.integer :device_class_id
      t.string :name
      t.string :model_number #型番
      t.string :serial_number #sn
      t.date :purchase_date
      t.integer :price
      t.date :last_inspection_date
      t.date :next_inspection_date
      t.integer :inspection_interval_id
      t.boolean :lending_status, default: 0
      t.timestamps
    end
  end
end
