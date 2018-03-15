class AddFrequencyColoumToTruck < ActiveRecord::Migration
  def change
  	add_column :trucks, :frequency, :string
  end
end
