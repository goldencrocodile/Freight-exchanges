class AddSharedColoumToLoads < ActiveRecord::Migration
  def change
  	add_column :loads, :sharing, :boolean, default: false
  end
end