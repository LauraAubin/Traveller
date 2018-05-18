#!/usr/bin/ruby

# For making http calls
require 'open-uri'

APP_ID = ""
APP_KEY = ""

HARD_CODED_ROUTE_NUMBER = "61"
HARD_CODED_STOP_NUMBER = "3008"

class Traveller
  def make_api_call(http_methods, route_number, stop_number)
    travel_info = open("https://api.octranspo1.com/v1.2/#{http_methods}?appID=#{APP_ID}&apiKey=#{APP_KEY}&routeNo=#{route_number}&stopNo=#{stop_number}").read
  end

  def get_next_bus(route_number, stop_number)
    http_methods = "GetNextTripsForStop"
    next_bus_key = "AdjustedScheduleTime";

    response = make_api_call(http_methods, route_number, stop_number)
    response.string_between_markers("<#{next_bus_key}>", "</#{next_bus_key}>")
  end
end

class String
  def string_between_markers(front, back)
    self[/#{Regexp.escape(front)}(.*?)#{Regexp.escape(back)}/m, 1]
  end
end

traveller = Traveller.new

output = traveller.get_next_bus(HARD_CODED_ROUTE_NUMBER, HARD_CODED_STOP_NUMBER)

puts output
