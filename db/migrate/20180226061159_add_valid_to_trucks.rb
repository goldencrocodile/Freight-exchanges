class AddValidToTrucks < ActiveRecord::Migration
  def change
	add_column :trucks, :truck_enabled, :boolean, default: true
  end
end
