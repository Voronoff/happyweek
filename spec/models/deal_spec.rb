require 'spec_helper'



describe Deal do
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
    it "finds the the items of those deals that are at time x and day y" do
      deals = Deal.deals_at_time('Thursday', '1:30 PM')
      expect(deals).to have(2).records
      expect(deals.where(:name => "Snacks From Home")).to have(1).record

    end
  end

  describe ".current_deals" do
    current_deals = Deal.current_deals
    it "finds the current deals" do
      expect(current_deals).to have(2).records
      expect(current_deals.where(:name => "Monkey head")).to have(1).record
    end
    it "loads the associated items" do
      current_deals.each {|deal| expect(deal.items.loaded?).to eql(true)}
    end
  end

end