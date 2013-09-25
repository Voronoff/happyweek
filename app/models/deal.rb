class Deal < ActiveRecord::Base
	belongs_to :venue

	def self.time_str_to_i(time_string)
		time_string, period = time_string.split(' ')
		time_array = time_string.split(':')
		time = (time_array[0].to_i * 60) + time_array[1].to_i
		if period == "PM" && time_string != "12:00"
			time += 720 
		end
		return time
	end

	def self.time_i_to_str(time)
		time_string = ((time / 60).to_i % 12).to_s + ':' + (time % 60).to_s
		if time < 720
			time_string += " AM" 
		else 
			time_string += " PM"
		end
		return time_string
	end

	def self.current_deals
		day = DateTime.now.strftime('%A')
		time = Deal.time_i_to_str((Time.now.seconds_since_midnight.to_i / 60).to_i)
		return self.deals_at_time(day, time)
	end

	def self.deals_at_time(day, time_string)
		time = Deal.time_str_to_i(time_string)
		return Deal.where("#{day.downcase} <> 'false' AND start_time <= :time AND end_time > :time", {time: time})
	end
end