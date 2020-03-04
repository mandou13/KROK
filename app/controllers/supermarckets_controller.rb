require 'json'
require 'open-uri'

class SupermarcketsController < ApplicationController

  def index
  url = 'https://api.github.com/users/ssaunier'
  user_serialized = open(url).read
  user = JSON.parse(user_serialized)
  @test = "#{user['name']} - #{user['bio']}"
  end
end
