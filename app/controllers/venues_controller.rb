class VenuesController < ApplicationController
  def show
    @venue = Venue.where(:id => params[:id]).includes(:deals)
  end
end