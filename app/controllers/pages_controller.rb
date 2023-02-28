class PagesController < ApplicationController
  def index
  end

  def results
    @geocoding_resp =
      HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GOOGLE_MAPS_API']}&censor=false&address=#{params[:zip]}")
  end
end
