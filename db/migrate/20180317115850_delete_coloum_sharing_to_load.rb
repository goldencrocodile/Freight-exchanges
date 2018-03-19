class DeleteColoumSharingToLoad < ActiveRecord::Migration
  def change
  	remove_column :loads, :sharing_load, :integer
  end
end
