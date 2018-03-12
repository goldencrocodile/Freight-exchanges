class AddTimeFieldToTrucks < ActiveRecord::Migration
  def change
  	add_column :trucks, :transit_time, :string
  end
end
