require 'spec_helper'



describe Deal do
  fixtures :deals
  fixtures :items

  describe "Deal.deals_at_time" do
    it "finds deals at time x and day y" do
      deals = Deal.deals_at_time('Thursday', '1:30 PM')
      expect(deals).to have(2).records
      expect(deals.where(:name => "Monkey Head")).to have(1).record
    end
    it "doesn't find other deals" do
      expect(Deal.where(:name => "Taco Tuesday")).to have(1).record
      expect(Deal.deals_at_time('Thursday', '1:30 PM').where(:name => "Taco Tuesday")).to have(0).records
    end
    it "doesn't find a deal on the wrong day" do
      deals = Deal.deals_at_time('Tuesday', '1:30 PM')
      expect(deals).to have(1).record
      expect(deals.where(:name => "Monkey Head")).to have(0).records
    end
    it "finds the the items of those deals that are at time x and day y" do
      deals = Deal.deals_at_time('Thursday', '1:30 PM')
      expect(deals).to have(2).records
      expect(deals.where(:name => "Snacks From Home")).to have(1).record

    end
  end

  describe "Deal.current_deals" do
    current_deals = Deal.current_deals
    it "finds the current deals" do
      expect(current_deals).to have(2).records
      expect(current_deals.where(:name => "Monkey Head")).to have(1).record
    end
    it "loads the associated items" do
      current_deals.each {|deal| expect(deal.items.loaded?).to eql(true)}
    end
  end

  describe ".days_string" do
    it "should return a string that represents the days of the deal" do
      expect(Deal.find_by_name("Monkey Head").days_string).to eql("Thurs")
      expect(Deal.find_by_name("Snacks From Home").days_string).to eql("Sun Mon Tues Weds Thurs Fri Sat")
    end
  end

end