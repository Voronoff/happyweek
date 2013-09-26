class Deal < ActiveRecord::Base
	belongs_to :venue

	def self.time_str_to_i(time_string)
		time_string, period = time_string.split(' ')
		time_array = time_string.split(':')
		time = (time_array[0].to_i * 60) + time_array[1].to_i
		time += 720 if period == "PM" && time_string != "12:00"
		return time
	end

	def self.time_i_to_str(time)
		minutes = sprintf '%02d', (time % 60)
		time_string = ((time / 60).to_i % 12).to_s + ':' + minutes
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
		self.deals_at_time(day, time)
	end

	def self.deals_at_time(day, time_string)
		time = Deal.time_str_to_i(time_string)
		Deal.where(day.downcase.to_sym => true).where("start_time <= :time AND end_time > :time", {time: time})
	end
end