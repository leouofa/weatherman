module PagesHelper
  def formatted_weather_date(date)
    mm_yy = Time.at(date).to_datetime.strftime('%F')

    return 'Today' if mm_yy == Date.today.strftime('%F')

    mm_yy
  end
end
