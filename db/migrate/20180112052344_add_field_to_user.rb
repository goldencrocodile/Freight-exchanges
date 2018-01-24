class AddFieldToUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :mobile_number, :string
  	add_column :users, :address_line1, :string
  	add_column :users, :address_line2, :string
  	add_column :users, :address_pin_code, :string
  	add_column :users, :address_country, :string
  	add_column :users, :address_state, :string
  	add_column :users, :address_city, :string
  	add_column :users, :company_type, :string
  	add_column :users, :company_pan_no, :string
  	add_column :users, :company_gst_no, :string
  	add_column :users, :other_detail_aadhaar_no, :string
  end
end
