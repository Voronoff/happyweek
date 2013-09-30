class DealsController < ApplicationController
  def now
    current_deals = Deal.current_deals
    deals = current_deals[0]
    @day = current_deals[1]
    @time = current_deals[2]
    @deal_sets = Deal.build_deal_sets(deals) 
  end
end