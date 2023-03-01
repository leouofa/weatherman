require 'rails_helper'

describe Geocoder do
  before :all do
    @geocoder = Geocoder.new
  end
  it 'can be instantiated' do
    expect(@geocoder).to be_instance_of(Geocoder)
  end

  it 'returns false if the address is invalid' do
    rsp = @geocoder.geocode(country: 'mars')
    expect(rsp).to eq(false)
  end

  it 'returns false coordinates if the address is incomplete' do
    rsp = @geocoder.geocode(address: '1103 E. 2nd St')
    expect(rsp).to eq(false)
  end

  it 'returns geolocation coordinates if the country is valid' do
    rsp = @geocoder.geocode(country: 'united states')
    expect(rsp).to be_instance_of(Hash)
  end

  it 'returns geolocation coordinates if the zip is valid' do
    rsp = @geocoder.geocode(zip: '85721')
    expect(rsp).to be_instance_of(Hash)
  end

  it 'returns geolocation coordinates if the state is valid' do
    rsp = @geocoder.geocode(state: 'AZ')
    expect(rsp).to be_instance_of(Hash)
  end

  it 'returns geolocation coordinates if the city is valid' do
    rsp = @geocoder.geocode(city: 'Tucson')
    expect(rsp).to be_instance_of(Hash)
  end

  it 'returns geolocation coordinates if the city and state are valid' do
    rsp = @geocoder.geocode(city: 'Tucson', state: 'AZ')
    expect(rsp).to be_instance_of(Hash)
  end
end