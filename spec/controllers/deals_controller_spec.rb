require 'spec_helper'

describe DealsController do
  fixtures :deals
  describe "GET now" do
    it "builds @deals from Deal.current_deals" do
      get :now
      expect(assigns(:deals)).to  eq(Deal.current_deals)
    end
    it "assigns @day and @time" do
      get :now
      expect(assigns(:day)).to eql("Thursday")
      expect(assigns(:time)).to eql("2:30 PM")
    end
    it "renders deals_at_time" do
      get :now
      expect(response).to render_template("deals_at_time")
    end
  end
  describe "GET deals_at/day/time" do
    it "builds @deals from Deal.deals_at_time(day, time)" do
      get :deals_at_time, {:day => "Thursday", :time => "870"}
      expect(assigns(:deals)).to  eq(Deal.deals_at_time("Thursday", "2:30 PM"))
    end
    it "assigns @day and @time" do
      get :now
      expect(assigns(:day)).to eql("Thursday")
      expect(assigns(:time)).to eql("2:30 PM")
    end
    it "renders deals_at_time" do
      get :now
      expect(response).to render_template("deals_at_time")
    end
  end
end