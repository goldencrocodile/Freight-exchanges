class AddDocumentationColoumToTrucks < ActiveRecord::Migration
  def change
  	add_column :trucks, :documentation, :boolean, default: false
  end
end
