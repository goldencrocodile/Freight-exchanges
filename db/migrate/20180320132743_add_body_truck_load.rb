class AddBodyTruckLoad < ActiveRecord::Migration
  def change
  	add_column :trucks, :truck_body, :boolean, default: true
  	add_column :loads, :load_body, :boolean, default: true
  end
end
