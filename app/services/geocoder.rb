class Geocoder
  def initialize
    @api_str =
      "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GOOGLE_MAPS_API']}&censor=false&address="
  end

  def geocode(address: nil, city: nil, state: nil, zip: nil, country: nil)
    geocoded_address = String.new
    geocoded_address << "#{address}. "   if address
    geocoded_address << "#{city}, #{state} "if city && state
    geocoded_address << "#{city} "if city && !state
    geocoded_address << "#{state} "if !city && state
    geocoded_address << zip if zip
    geocoded_address << " #{country}" if country

    rsp = HTTParty.get("#{@api_str}#{geocoded_address}")

    return false if rsp['results'].blank?

    rsp['results'][0]['geometry']['location']
  end
end