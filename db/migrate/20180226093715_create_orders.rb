class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :product_id
      t.string :price
      t.string :status
      t.string :payment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
