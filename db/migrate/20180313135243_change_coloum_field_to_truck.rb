class ChangeColoumFieldToTruck < ActiveRecord::Migration
  def up
		change_column :trucks, :truck_booked, :string, default: "request"
    end
    def down
			change_column :trucks, :truck_booked, :boolean
    end
end
