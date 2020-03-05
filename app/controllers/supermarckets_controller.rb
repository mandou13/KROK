require 'json'
require 'open-uri'

class SupermarcketsController < ApplicationController

  def index
    coordonates = '50.630125,3.013894'
    url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.630125,3.013894&radius=800000&keyword=Grocery store&key=AIzaSyCci3T2TVK23rtk8I6cpjXUrhgyCWEPz4w'
    supermarckets_serialized = open(url).read
    @supermarckets = JSON.parse(supermarckets_serialized)["results"]
    url2 = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=carrefour&location=50.630125,3.013894&radius=800000&key=AIzaSyCci3T2TVK23rtk8I6cpjXUrhgyCWEPz4w'
    supermarckets_serialized2 = open(url2).read
    @supermarckets2 = JSON.parse(supermarckets_serialized2)["results"]
    # @supermarcket_markers = []
    @markers = @supermarckets2.map do |supermarcket|
      {
        lat: supermarcket["geometry"]["location"]["lat"],
        lng: supermarcket["geometry"]["location"]["lng"],
        infoWindow: render_to_string(partial: "info_window", locals: { supermarcket: supermarcket }),
        image_url: helpers.asset_url('logo-krok.png')
      }
    end
  end
end



# url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.8534,2.3488&radius=500&keyword=#{translation[tag]}&key=#{ENV['GOOGLE_API_PLACES_KEY']}"
#       data_api = open(url).read
#       parsing = JSON.parse(data_api)["results"]
