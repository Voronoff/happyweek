class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
    	t.integer :venue_id
    	t.string :name
    	t.string :days
    	t.time :start_time
    	t.time :end_time
    	t.string :category
    	t.string :variety
    	t.integer :cost
    	t.integer :discount

    	t.timestamps
    end
  end
end
