require 'spec_helper'

describe DealsController do
  fixtures :deals
  describe "GET now" do
    before do
    end
    after do
      Timecop.return
    end
    it "builds @deal_sets from the current deals" do
      get :now
    end
    it "assigns @day and @time" do
      Timecop.freeze('260913  13:30 ' + Time.now.zone, '%d%m%y %H:%M %Z')
      get :now
      assigns(:day).should eql("Thursday")
      assigns(:time).should eql("2:30 PM")
    end
  end
end