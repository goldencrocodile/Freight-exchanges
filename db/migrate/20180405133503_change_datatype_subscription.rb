class ChangeDatatypeSubscription < ActiveRecord::Migration
  def change
  	change_column :subscriptions, :plan_id, :string
  	change_column :subscriptions, :user_id, :string
  end
end
