class AddShareColoumToTrucks < ActiveRecord::Migration
  def change
	add_column :trucks, :sharing, :boolean, default: false
  end
end
