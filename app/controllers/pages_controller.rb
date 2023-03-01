class PagesController < ApplicationController
  def index
  end

  def results
    @cached = false

    coordinates = Geocoder.new.geocode(
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      country: params[:country]
    )

    if params[:zip].present?
      @cached = true if Rails.cache.exist?(params[:zip])

      @results = Rails.cache.fetch(params[:zip], expires_in: 30.minutes) do
                  if coordinates
                    ForecastGetter.new(lat: coordinates['lat'], lng: coordinates['lng']).results
                  else
                    nil
                  end
      end

    else
      @results = if coordinates
                   ForecastGetter.new(lat: coordinates['lat'], lng: coordinates['lng']).results
                 else
                   nil
                 end
    end
  end

  private




end
