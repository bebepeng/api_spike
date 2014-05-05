require 'faraday'
require 'json'

class Weather
  def initialize(city)
    response = Faraday.get "http://api.openweathermap.org/data/2.5/weather?q=#{city}"
    @weather_data = JSON.parse(response.body)
  end
  def forecast
   @weather_data["weather"].first["description"]
  end
end