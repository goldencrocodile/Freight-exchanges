class AddShareingFieldToLoadIneteger < ActiveRecord::Migration
  def change
  	add_column :loads, :sharing_load, :integer, default: false
  end
end
