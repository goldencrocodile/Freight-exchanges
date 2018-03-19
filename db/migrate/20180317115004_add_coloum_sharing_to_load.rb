class AddColoumSharingToLoad < ActiveRecord::Migration
  def up
  	add_column :loads, :sharing_load, :integer
  end
end
