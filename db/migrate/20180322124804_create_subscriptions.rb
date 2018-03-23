class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :plan_id
      t.integer :user_id
      t.datetime :start_at
      t.integer :total_count

      t.timestamps
    end
  end
end
