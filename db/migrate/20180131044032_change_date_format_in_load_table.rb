class ChangeDateFormatInLoadTable < ActiveRecord::Migration
  def up
    change_column :loads, :load_schedule_date, :date
  end

  def down
    change_column :loads, :load_schedule_date, :datetime
  end
end
