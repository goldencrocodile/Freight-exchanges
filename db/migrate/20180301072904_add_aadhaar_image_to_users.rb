class AddAadhaarImageToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :aadhaar_no_image
  end

  def down
    remove_attachment :users, :aadhaar_no_image
  end
end
