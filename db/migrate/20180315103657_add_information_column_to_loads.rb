class AddInformationColumnToLoads < ActiveRecord::Migration
  def change
  	add_column :loads, :information, :text
  end
end
