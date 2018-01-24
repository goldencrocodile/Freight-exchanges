class AddTYpeFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :u_type, :string
  end
end
