require 'time_transformer'

class Deal < ActiveRecord::Base
	belongs_to :venue
  has_many :items
  validates :venue_id, :presence => {:message => 'Deal must be assigned to a venue.'}
  validates :name, :presence => {:message => 'Deal must have a name.'}

  scope :items_at_time, ->(time) {where("items.start_time <= :time AND items.end_time > :time", {time: time})}

  def self.current_deals
    day = DateTime.now.strftime('%A')
    time = TimeTransformer.i_to_str((Time.now.seconds_since_midnight.to_i / 60).to_i)
    return self.deals_at_time(day, time)
  end

  def self.deals_at_time(day, time_string)
    time = TimeTransformer.str_to_i(time_string)
    Deal.joins(:items).where(day.downcase.to_sym => true).items_at_time(time).includes(:items)
  end

  def days_string
    days_string = ""
    days_string += "Sun " if self.sunday == true
    days_string += "Mon " if self.monday == true
    days_string += "Tues " if self.tuesday == true
    days_string += "Weds " if self.wednesday == true
    days_string += "Thurs " if self.thursday == true
    days_string += "Fri " if self.friday == true
    days_string += "Sat" if self.saturday == true
    return days_string.rstrip
  end
end