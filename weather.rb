require 'faraday'
require 'json'

class Weather
  def initialize(city)
    @city = city
  end

  def forecast
    get_weather("weather?q=#{@city}")["weather"].first["description"]
  end

  def seven_day
    get_weather("forecast/daily?q=#{@city}&mode=json&cnt=7")["list"].each_with_object([]) do |day, weeks_forecast|
      weeks_forecast << day["weather"].first["description"]
    end
  end

  private
  def get_weather(url = "")
    response = Faraday.get "http://api.openweathermap.org/data/2.5/" << url
    JSON.parse(response.body)
  end
end