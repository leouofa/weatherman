class PagesController < ApplicationController
  def index
  end

  def results
    coordinates = Geocoder.new.geocode(
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      country: params[:country]
    )

    @results = if coordinates
                  ForecastGetter.new(lat: coordinates['lat'], lng: coordinates['lng']).results
               else
                 nil
               end
  end

  private



end
