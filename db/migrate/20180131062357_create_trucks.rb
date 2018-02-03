class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :vehicle_number
      t.string :driver_name
      t.string :driver_mobile_no
      t.string :truck_weight
      t.string :truck_type
      t.date :schedule_date
      t.string :truck_from
      t.string :truck_to

      t.timestamps
    end
  end
end
