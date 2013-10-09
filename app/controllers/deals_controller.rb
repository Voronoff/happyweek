class DealsController < ApplicationController
  def now
    @deals = Deal.current_deals
    @day = DateTime.now.strftime('%A')
    @time = TimeTransformer.i_to_str((Time.now.seconds_since_midnight.to_i / 60).to_i)
  end
end