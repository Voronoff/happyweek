require 'spec_helper'



describe Deal do
  before(:all) do
  DAY_DATES = {:sunday => DateTime.strptime('Sunday220913', '%A%d%m%y'),
                :monday => DateTime.strptime('Monday230913', '%A%d%m%y'),
                :tuesday => DateTime.strptime('Tuesday240913', '%A%d%m%y'),
                :wednesday => DateTime.strptime('Wednesday250913', '%A%d%m%y'),
                :thursday => DateTime.strptime('Thursday260913', '%A%d%m%y'),
                :friday => DateTime.strptime('Friday270913', '%A%d%m%y'),
                :saturday => DateTime.strptime('Saturday280913', '%A%d%m%y')}
  TIME_ZONE = Time.now.zone
  end
  fixtures :deals

  describe "when converting time formats" do
    it "can convert time from string to int" do
      Deal.time_str_to_i('2:30 PM').should eql(870)
      Deal.time_str_to_i('2:30 AM').should eql(150)
    end
    it "can convert time from int to string" do
      Deal.time_i_to_str(870).should eql('2:30 PM')
      Deal.time_i_to_str(150).should eql('2:30 AM')
    end
  end

  describe ".deals_at_time" do
    it "finds deals at time x and day y" do
      expect(Deal.deals_at_time('Thursday', '1:30 PM')).to have(2).records
      expect(Deal.deals_at_time('Thursday', '1:30 PM').where(:name => "Monkey head")).to have(1).record
    end
    it "doesn't find other deals" do
      expect(Deal.where(:name => "Taco Tuesday")).to have(1).record
      expect(Deal.deals_at_time('Thursday', '1:30 PM').where(:name => "Taco Tuesday")).to have(0).records
    end
    it "doesn't find a deal on the wrong day" do
        expect(Deal.deals_at_time('Tuesday', '1:30 PM')).to have(1).record
        expect(Deal.deals_at_time('Tuesday', '1:30 PM').where(:name => "Monkey head")).to have(0).records
    end
  end

  describe ".current_deals" do

    before do
      Timecop.freeze(DateTime.strptime(DAY_DATES[:thursday].strftime('%d%m%y') + ' 13:30 ' + TIME_ZONE, '%d%m%y %H:%M %Z'))
      $stderr.puts DateTime.now.strftime('%A %H:%M')
    end

    after do
      Timecop.return
    end

    it "finds the current deals" do
      expect(Deal.current_deals).to have(2).records
      expect(Deal.current_deals.where(:name => "Monkey head")).to have(1).record
    end

  end
end