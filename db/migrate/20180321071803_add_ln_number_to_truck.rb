class AddLnNumberToTruck < ActiveRecord::Migration
  def change
  	add_column :trucks, :licence_number, :string
  	add_column :trucks, :current_transporter_name, :string
  end
end