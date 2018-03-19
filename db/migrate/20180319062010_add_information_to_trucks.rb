class AddInformationToTrucks < ActiveRecord::Migration
  def change
  	add_column :trucks, :information, :text
  end
end