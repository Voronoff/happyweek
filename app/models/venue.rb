class Venue < ActiveRecord::Base
	has_many :deals
	# attr_accessible :name, :address, :city
end