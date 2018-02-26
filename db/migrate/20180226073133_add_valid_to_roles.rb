class AddValidToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :role_enabled, :boolean, default: true
  end
end
