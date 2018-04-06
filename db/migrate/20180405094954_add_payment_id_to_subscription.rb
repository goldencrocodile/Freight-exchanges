class AddPaymentIdToSubscription < ActiveRecord::Migration
  def change
		add_column :subscriptions, :payment_id, :string
  end
end