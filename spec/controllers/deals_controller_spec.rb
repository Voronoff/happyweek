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
      get :deals_at_time, {:day => "Tuesday", :time => "900"}
      expect(assigns(:deals)).to  eq(Deal.deals_at_time("Tuesday", "3:00 PM"))
    end
    it "assigns @day and @time" do
      get :deals_at_time, {:day => "Tuesday", :time => "900"}
      expect(assigns(:day)).to eql("Tuesday")
      expect(assigns(:time)).to eql("3:00 PM")
    end
    it "renders deals_at_time" do
      get :deals_at_time, {:day => "Tuesday", :time => "900"}
      expect(response).to render_template("deals_at_time")
    end
  end

  describe "GET /find_deals_at_time/" do
    it "redirects to /deals_at_time/now if there is no user entered data" do
      expect(DateTime.now.strftime('%A')).to eql("Thursday")
      expect(DateTime.now.strftime('%p')).to eql("PM")
      get :find_deals_at_time, {:day => "Thursday", :hours => "", :minutes => "", :meridiem => "PM"}
      expect(response).to redirect_to("/deals_at_time/now")
      get :find_deals_at_time, {:day => "Today", :hours => "", :minutes => "", :meridiem => "PM"}
      expect(response).to redirect_to("/deals_at_time/now")
    end
    it "redirects to /deals_at_time/:day/:time if there is user entered data" do
      get :find_deals_at_time, {:day => "Tuesday", :hours => "11", :minutes => "30", :meridiem => "AM"}
      expect(response).to redirect_to("/deals_at_time/Tuesday/690")
      get :find_deals_at_time, {:day => "Today", :hours => "11", :minutes => "30", :meridiem => "AM"}
      expect(response).to redirect_to("/deals_at_time/Thursday/690")
    end
    it "handles 12:xx correctly" do
      get :find_deals_at_time, {:day => "Tuesday", :hours => "12", :minutes => "00", :meridiem => "AM"}
      expect(response).to redirect_to("/deals_at_time/Tuesday/1440")
      get :find_deals_at_time, {:day => "Tuesday", :hours => "12", :minutes => "00", :meridiem => "PM"}
      expect(response).to redirect_to("/deals_at_time/Tuesday/720")
      get :find_deals_at_time, {:day => "Tuesday", :hours => "12", :minutes => "30", :meridiem => "AM"}
      expect(response).to redirect_to("/deals_at_time/Tuesday/30")
      get :find_deals_at_time, {:day => "Tuesday", :hours => "12", :minutes => "30", :meridiem => "PM"}
      expect(response).to redirect_to("/deals_at_time/Tuesday/750")
    end
  end

end