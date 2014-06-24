require 'rubygems'

require 'sinatra'
require 'weather_hacker'
require 'yaml'

#require 'newrelic_rpm'

get '/' do
  zipcode ='164-0014'
  client = WeatherHacker::Client.new
  y = client.get_weather(zipcode)
  #puts y
  #puts y['weather']

  images = ["pharrell_1.jpg","pharrell_2.jpg","pharrell_3.jpg"]

  if y['weather'] == '晴れ'
    pharrell = 'ふぁれてる！'
  end

  if y['weather'] == '晴時々曇'
    pharrell = 'ときどきふぁれてない・・'
  end
  if y['weather'] == '晴のち曇'
    pharrell = 'あさしかふぁれてない・・'
  end
  if y['weather'] == '曇のち雨'
    pharrell = 'ふぁれてない・・'
  end
  if y['weather'] == '曇'
    pharrell = 'ふぁれてない・・'
  end
  if y['weather'] == '雨'
    pharrell = 'さみゅえるえるじゃくそん'
    images = ["pharrell_4.jpg","samuel_1.jpg"]
  end
  img = images[rand(images.size)]

  #puts y['weather']
  #puts pharrell
  #puts images

  #puts y

  erb :index,
    :locals => {
      :y => y,
      :pharrell => pharrell,
      :img => img,
    }

end
