class AddBookedColoumToTrucks < ActiveRecord::Migration
  def change
	add_column :trucks, :truck_booked, :boolean, default: false
  end
end