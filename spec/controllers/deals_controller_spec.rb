require 'spec_helper'

describe DealsController do
  fixtures :deals
  describe "GET now" do
    it "builds @deals from the current deals" do
      get :now
      assigns(:deals).should  eq(Deal.current_deals)
    end
    it "assigns @day and @time" do
      get :now
      assigns(:day).should eql("Thursday")
      assigns(:time).should eql("2:30 PM")
    end
  end
end