require 'json'
require 'open-uri'

class SupermarcketsController < ApplicationController

  def index
    @planner = Planner.all[-2]
    coord = params[:query_geoloc]
    supermarcket_types = ["carrefour", "monoprix", "lidl", "auchan"]
    @markers = []
    @markers_open_only = []
    supermarcket_types.each do |supermarcket_type|
      url_supermarcket_type = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{supermarcket_type}&location=#{coord}&radius=10000&key=AIzaSyCci3T2TVK23rtk8I6cpjXUrhgyCWEPz4w"
      # url_supermarcket_type = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{supermarcket_type}&location=#{coord}&radius=10000&key=#{ENV['GOOGLE_API_PLACES_KEY']}"
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

      @markers_supermarcket_type_open_only = @supermarckets_type.map do |supermarcket|
        unless supermarcket["opening_hours"].nil? || supermarcket["opening_hours"]["open_now"] == false
          {
            lat: supermarcket["geometry"]["location"]["lat"],
            lng: supermarcket["geometry"]["location"]["lng"],
            infoWindow: render_to_string(partial: "info_window", locals: { supermarcket: supermarcket }),
            image_url: helpers.asset_url("#{supermarcket_type}.png")
          }
        end
      end
      @markers_open_only << @markers_supermarcket_type_open_only
    end
      @markers = @markers.first + @markers.second + @markers.third + @markers.fourth
      @markers_open_only = @markers_open_only.first + @markers_open_only.second + @markers_open_only.third + @markers_open_only.fourth
  end
end
