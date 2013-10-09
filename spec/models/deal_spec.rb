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


  describe ".deals_at_time" do
    it "finds deals at time x and day y" do
      deals = Deal.deals_at_time('Thursday', '1:30 PM')
      expect(deals).to have(2).records
      expect(deals.where(:name => "Monkey head")).to have(1).record
    end
    it "doesn't find other deals" do
      expect(Deal.where(:name => "Taco Tuesday")).to have(1).record
      expect(Deal.deals_at_time('Thursday', '1:30 PM').where(:name => "Taco Tuesday")).to have(0).records
    end
    it "doesn't find a deal on the wrong day" do
        deals = Deal.deals_at_time('Tuesday', '1:30 PM')
        expect(deals).to have(1).record
        expect(deals.where(:name => "Monkey head")).to have(0).records
    end
  end

  describe ".current_deals" do
    before(:all) do
      Timecop.freeze(DateTime.strptime(DAY_DATES[:thursday].strftime('%d%m%y') + ' 13:30 ' + TIME_ZONE, '%d%m%y %H:%M %Z'))
    end
    after(:all) do
      Timecop.return
    end

    it "finds the current deals" do
      current_deals = Deal.current_deals
      expect(current_deals[0]).to have(2).records
      expect(current_deals[0].where(:name => "Monkey head")).to have(1).record
    end
    it "should have the right day and time" do 
      current_deals = Deal.current_deals
      current_deals[1].should eql("Thursday")
      current_deals[2].should eql("1:30 PM")
    end
  end

end