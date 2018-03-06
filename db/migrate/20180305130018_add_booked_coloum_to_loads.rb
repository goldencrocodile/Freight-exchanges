class AddBookedColoumToLoads < ActiveRecord::Migration
  def change
		add_column :loads, :booked, :boolean, default: false
  end
end