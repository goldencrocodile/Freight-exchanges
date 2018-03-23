class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :period
      t.string :name
      t.string :description
      t.string :currency
      t.string :amount
      t.string :string
      t.string :notes
      t.timestamps
    end
  end
end