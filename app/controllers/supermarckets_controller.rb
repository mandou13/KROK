require 'json'
require 'open-uri'

class SupermarcketsController < ApplicationController

  def index
    coordonates = '50.630125,3.013894'
    supermarcket_types = ["carrefour", "monoprix", "lidl", "auchan"]
    @markers = []
    supermarcket_types.each do |supermarcket_type|
      url_supermarcket_type = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{supermarcket_type}&location=50.630125,3.013894&radius=10000&key=AIzaSyCci3T2TVK23rtk8I6cpjXUrhgyCWEPz4w"
      supermarckets_type_serialized = open(url_supermarcket_type).read
      @supermarckets_type = JSON.parse(supermarckets_type_serialized)["results"]
      @markers_supermarcket_type = @supermarckets_type.map do |supermarcket|
        {
          lat: supermarcket["geometry"]["location"]["lat"],
          lng: supermarcket["geometry"]["location"]["lng"],
          infoWindow: render_to_string(partial: "info_window", locals: { supermarcket: supermarcket }),
          image_url: helpers.asset_url("#{supermarcket_type}.png")
        }
      end
      @markers << @markers_supermarcket_type
    end
      # @markers = @markers.map(&:first)
      @markers = @markers.first + @markers.second + @markers.third + @markers.fourth
  end
end



# url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.8534,2.3488&radius=500&keyword=#{translation[tag]}&key=#{ENV['GOOGLE_API_PLACES_KEY']}"
#       data_api = open(url).read
#       parsing = JSON.parse(data_api)["results"]
