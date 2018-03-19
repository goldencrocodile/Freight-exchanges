class ChangeColoumShareingToLoad < ActiveRecord::Migration
  # def up
  #   add_column :loads, :sharing, :integer
  # end
  def down
    remove_column :loads, :sharing, :boolean, default: false
  end
end