module PagesHelper
  def formatted_weather_date(date)
    return '' unless date


    converted_date = Time.at(date).to_datetime
    string_date = converted_date.strftime('%F')

    return "Today" if string_date == Date.today.strftime('%F')
    return "Tomorrow" if string_date == (Date.today + 1).strftime('%F')

    string_date
  end

  def formatted_temp(temp:, label:)
    return '' unless temp

    "#{label}: #{temp}°"
  end
end
