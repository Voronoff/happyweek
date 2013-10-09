class TimeTransformer

  def self.str_to_i(time_string)
    time_string, period = time_string.split(' ')
    time_array = time_string.split(':')
    time = (time_array[0].to_i * 60) + time_array[1].to_i
    time += 720 if period == "PM" && time_string != "12:00"
    return time
  end

  def self.i_to_str(time)
    minutes = sprintf '%02d', (time % 60)
    time_string = ((time / 60).to_i % 12).to_s + ':' + minutes
    if time < 720
      time_string += " AM" 
    else 
      time_string += " PM"
    end
    return time_string
  end

end