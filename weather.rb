require 'faraday'
require 'json'

class Weather
  def initialize(city)
    @city = city
  end

  def forecast
    response = Faraday.get "http://api.openweathermap.org/data/2.5/weather?q=#{@city}"
    weather_data = JSON.parse(response.body)
    weather_data["weather"].first["description"]
  end

  def seven_day
    response = Faraday.get "http://api.openweathermap.org/data/2.5/forecast/daily?q=#{@city}&mode=json&cnt=7"
    weather_data = JSON.parse(response.body)
    weather_data["list"].each_with_object([]) do |day, weeks_forecast|
      weeks_forecast << day["weather"].first["description"]
    end
  end
end