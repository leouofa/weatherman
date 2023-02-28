class ForecastGetter
  def initialize(lat:, lng:)
    @forecast_resp =
      HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{lng}&appid=#{ENV['WEATHER_API']}")
    # active date processing

    active_date = nil
    @formatted_results = []

    @forecast_resp['list'].each do |forecast|
      date_being_processed = Time.at(forecast["dt"]).to_datetime.strftime("%F")

      next if active_date == date_being_processed

      active_date = date_being_processed if active_date.nil? || date_being_processed > active_date

      @formatted_results.push format_forecast(forecast)
    end

  end

  def format_forecast(forecast)
    formatted_forecast = { temp: nil, temp_min: nil, temp_max: nil }
    formatted_forecast[:date] = forecast["dt"].present? ? forecast["dt"] : nil

    unless forecast["main"].blank?
      formatted_forecast[:temp] = forecast["main"]["temp"].present? ? forecast["main"]["temp"] : nil
      formatted_forecast[:temp_min] = forecast["main"]["temp_min"].present? ? forecast["main"]["temp_min"] : nil
      formatted_forecast[:temp_max] = forecast["main"]["temp_max"].present? ? forecast["main"]["temp_max"] : nil
    end

    formatted_forecast
  end

  def formatted_results
    @formatted_results
  end

end
