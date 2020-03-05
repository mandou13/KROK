require 'json'
require 'open-uri'

class SupermarcketsController < ApplicationController

  def index
    coord = params[:query_geoloc]
    supermarcket_types = ["carrefour", "monoprix", "lidl", "auchan"]
    @markers = []
    supermarcket_types.each do |supermarcket_type|
      url_supermarcket_type = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{supermarcket_type}&location=#{coord}&radius=10000&key=AIzaSyCci3T2TVK23rtk8I6cpjXUrhgyCWEPz4w"
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
      @markers = @markers.first + @markers.second + @markers.third + @markers.fourth
  end
end
