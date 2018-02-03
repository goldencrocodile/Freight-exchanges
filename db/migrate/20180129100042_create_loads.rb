class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.string :load_from
      t.string :load_to
      t.string :load_material
      t.string :load_weight
      t.string :load_truck_type
      t.integer :load_no_of_truck
      t.datetime :load_schedule_date

      t.timestamps
    end
  end
end
