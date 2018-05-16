#!/usr/bin/ruby

require 'open-uri'
require 'json'

APP_ID = ""
APP_KEY = ""

class Traveller
  def make_general_api_call (
    http_methods = "GetRouteSummaryForStop",
    route_number = "1",
    stop_number = "1000" )

    open("https://api.octranspo1.com/v1.2/#{http_methods}?appID=#{APP_ID}&apiKey=#{APP_KEY}&routeNo=#{route_number}&stopNo=#{stop_number}")
  end
end

traveller = Traveller.new

puts traveller.make_general_api_call
