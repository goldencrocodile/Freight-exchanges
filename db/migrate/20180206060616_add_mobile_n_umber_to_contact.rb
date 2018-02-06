class AddMobileNUmberToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :mobile_number, :string
  end
end
