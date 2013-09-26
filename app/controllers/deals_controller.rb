class DealsController < ApplicationController
	def now
		@deals = Deal.current_deals
	end
end