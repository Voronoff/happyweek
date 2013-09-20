class AddSummaryToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :summary, :string
  end
end
