class AddSubscriptionFieldToUser < ActiveRecord::Migration
  def change
  	add_column :users, :subscription_date, :datetime
  end
end
