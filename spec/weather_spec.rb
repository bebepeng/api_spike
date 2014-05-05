require 'rspec'
require_relative '../weather'

describe Weather do
  before do
    @weather = Weather.new("boulder,co")
  end
  it 'displays the current weather' do
    expect(@weather.forecast).to eq "few clouds"
  end
  it 'displays the 7 day forcast' do
    expect(@weather.seven_day).to eq ["few clouds", "scattered clouds", "light rain", "light rain", "light rain", "moderate rain", "light rain"]
  end
end