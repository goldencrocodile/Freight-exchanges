class AddValidToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :load_enabled, :boolean, default: true
  end
end
