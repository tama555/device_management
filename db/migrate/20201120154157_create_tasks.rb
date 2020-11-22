class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :submitter
      t.integer :user_id
      t.integer :device_id
      t.date :date_of_receipt
      t.string :department
      t.text :trouble_content
      t.text :correspondence
      t.text :note
      t.timestamps
    end
  end
end
