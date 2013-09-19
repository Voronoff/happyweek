class Venue < ActiveRecord::Base
	attr_accessible :name, :address, :city
end