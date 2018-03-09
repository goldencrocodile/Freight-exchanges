class AddPriceColoumToTrucks < ActiveRecord::Migration
  def change
  	add_column :trucks, :expected_price, :string
  end
end
