class ChangeCostAndDiscountToFloatsInDeals < ActiveRecord::Migration
  def change
  	 change_column :deals, :cost, :float
  	 change_column :deals, :discount, :float
  end
end
