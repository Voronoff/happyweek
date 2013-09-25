class ChangeStartTimeAndEndTimeToIntsInDeals < ActiveRecord::Migration
  def change
  	change_column :deals, :start_time, :integer
  	change_column :deals, :end_time, :integer
  end
end
