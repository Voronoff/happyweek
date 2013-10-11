require 'spec_helper'

describe VenuesController do
  fixtures :venues
  describe "GET /venues/:id" do
    it "assigns @venue" do
      get :show, :id => 1
      expect(assigns(:venue)).to eq(Venue.where(:id => 1))
    end
    it "renders show" do
      get :show, :id => 1
      expect(response).to render_template("show")
    end
  end
end