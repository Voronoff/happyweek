class DealsController < ApplicationController

  def now
    @deals = Deal.current_deals
    @day = DateTime.now.strftime('%A')
    @time = TimeTransformer.i_to_str(Time.now.seconds_since_midnight.to_i / 60)
    render "deals_at_time"
  end

  def deals_at_time
    time = TimeTransformer.i_to_str(params[:time].to_i)
    @deals = Deal.deals_at_time(params[:day], time)
    @day = params[:day]
    @time = time
  end

  def find_deals_at_time
    timestring = params[:hours] + ':' + params[:minutes] + ' ' + params[:meridiem]
    current_time = Time.now.seconds_since_midnight.to_i / 60
    current_day = DateTime.now.strftime('%A')
    current_meridiem = Time.now.strftime('%p') 
    if (params[:day] ==  current_day || params[:day] == 'Today') && (timestring == ': ' + current_meridiem || timestring == TimeTransformer.i_to_str(current_time))
      redirect_to "/deals_at_time/now"
    else
      params[:day] == "Today" ? day = current_day : day = params[:day] 
      time = 0
      time += params[:hours].to_i * 60
      time += params[:minutes].to_i
      time += 720 if (params[:meridiem] == "PM" && params[:hours] != "12")
      if (params[:hours] == "12" && params[:meridiem] == "AM")
        params[:minutes].to_i == 0 || (params[:minutes] == '' && current_time % 60 == 0) ? time += 720 : time -=720
      end
      redirect_to "/deals_at_time/#{day}/#{time}"
    end
  end

end