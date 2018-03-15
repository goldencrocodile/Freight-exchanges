class ChangeColoumFieldToLoad < ActiveRecord::Migration
  def up
		change_column :loads, :booked, :string, default: "request"
    end
    def down
			change_column :loads, :booked, :boolean
    end
end
