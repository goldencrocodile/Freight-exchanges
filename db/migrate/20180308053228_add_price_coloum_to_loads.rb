class AddPriceColoumToLoads < ActiveRecord::Migration
  def change
	add_column :loads, :expected_price, :string
  end
end
