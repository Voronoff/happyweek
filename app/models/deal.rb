class Deal < ActiveRecord::Base
	belongs_to :venue

	def self.time_str_to_i(time_string)
		time_array = time_string.split(':')
		time = (time_array[0].to_i * 60) + time_array[1].to_i
		return time
	end

	def self.time_i_to_str(time)
		time_string = (time / 60).to_s + ':' + (time % 60).to_s
		return time_string
	end

	def self.current_deals
		now = Time.now.strftime('%H:%M')
		return self.deals_at_time(now)
	end

	def self.deals_at_time(time_string)
		time = Deal.time_str_to_i(time_string)
		return Deal.where("start_time <= :time AND end_time > :time", {time: time})
	end
end