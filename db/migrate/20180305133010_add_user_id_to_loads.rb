class AddUserIdToLoads < ActiveRecord::Migration
  def change
	add_column :loads, :user_id, :integer
	add_column :trucks, :user_id, :integer
  end
end