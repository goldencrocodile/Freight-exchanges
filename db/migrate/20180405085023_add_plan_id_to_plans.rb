class AddPlanIdToPlans < ActiveRecord::Migration
  def change
  	add_column :plans, :plan_token, :string
  end
end
