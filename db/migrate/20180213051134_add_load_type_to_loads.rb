class AddLoadTypeToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :load_type, :string
  end
end
