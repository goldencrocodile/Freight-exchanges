class AddPinCodeToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :source_pin_code, :string
    add_column :loads, :destination_pin_code, :string
  end
end
