class PagesController < ApplicationController
  def index
  end

  def results
    @geocoding_resp =
      HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GOOGLE_MAPS_API']}&censor=false&address=#{params[:zip]}")

    coordinates = @geocoding_resp['results'][0]['geometry']['location']


    @forecast_resp =
      HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?lat=#{coordinates['lat']}&lon=#{coordinates['lng']}&appid=#{ENV['WEATHER_API']}")

    # active date processing

    active_date = nil
    @parsed_results = []
    @parsed_forecast = @forecast_resp['list'].each do |date_time|
      date_being_processed = Time.at(date_time["dt"]).to_datetime.strftime("%F")

      next if active_date == date_being_processed

      active_date = date_being_processed if active_date.nil? || date_being_processed > active_date

      @parsed_results.push(date_time)
    end
  end

  private



end
