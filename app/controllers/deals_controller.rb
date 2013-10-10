class DealsController < ApplicationController
  def now
    @deals = Deal.current_deals
    @day = DateTime.now.strftime('%A')
    @time = TimeTransformer.i_to_str((Time.now.seconds_since_midnight.to_i / 60).to_i)
    render "deals_at_time"
  end
  def deals_at_time
    time = TimeTransformer.i_to_str(params[:time].to_i)
    @deals = Deal.deals_at_time(params[:day], time)
    @day = params[:day]
    @time = time
  end
end