class Deal < ActiveRecord::Base
	belongs_to :venue
	
	# attr_accessible :venue_id, :name, :days, :start_time, :end_time, :category, :variety, :cost, :discount	
end