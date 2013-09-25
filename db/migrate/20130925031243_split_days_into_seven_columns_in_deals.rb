class SplitDaysIntoSevenColumnsInDeals < ActiveRecord::Migration
  def change
  	remove_column :deals, :days, :string
  	add_column :deals, :sunday, :boolean
  	add_column :deals, :monday, :boolean
  	add_column :deals, :tuesday, :boolean
  	add_column :deals, :wednesday, :boolean
  	add_column :deals, :thursday, :boolean
  	add_column :deals, :friday, :boolean
  	add_column :deals, :saturday, :boolean
  end
end
