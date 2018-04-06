class AddnextDuedateOnSubscription < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :next_due_date, :datetime
  	add_column :subscriptions, :status, :string
  end
end
