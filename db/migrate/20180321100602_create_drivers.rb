class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :lic_number
      t.integer :rating
      t.string :transporter_name
      t.integer :truck_id

      t.timestamps
    end
  end
end
