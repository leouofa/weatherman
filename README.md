# Weatherman 🌤️️❄️🌧️

The weatherman app tells you the weather for a given address.

## Requirements
- [OpenWeatherMap API](https://www.openweathermap.org) Key.
- [Google API](https://developers.google.com/maps/documentation/javascript/get-api-key) Key.
- PostresSQL

## Setup
1. Pull the Repo with 
 
```
git clone repo folder
```

2. Go inside the ```folder``` you just created and run 
```bash
bundle install
```

3. Setup the database with 
```bash
bin/rails db:create
```

4. Create the ```.env``` in the root directory of the rails project and populated it 
with OpenWeatherMap and Google Maps API Key.
 
```dotenv
WEATHER_API = xxxxxxxxxxxxxxxxx
GOOGLE_MAPS_API = xxxxxxxxxxxxxxxxx
```

## Starting The Project 
To start the project execute 
```bash
foreman start -f Procfile.dev 
```

## Testing
Run ```rspec``` to execute the test suite.