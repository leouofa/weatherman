class PagesController < ApplicationController
  def index
  end

  def results
    @cached = false

    if params[:zip].present?
      @cached = true if Rails.cache.exist?(params[:zip])

      @results = Rails.cache.fetch(params[:zip], expires_in: 10.seconds) do
        coordinates = Geocoder.new.geocode(
          address: params[:address],
          city: params[:city],
          state: params[:state],
          zip: params[:zip],
          country: params[:country]
        )
        coordinates ? ForecastGetter.new(lat: coordinates['lat'], lng: coordinates['lng']).results : nil
      end
    else

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
  end

  private




end
