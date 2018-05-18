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

  def get_next_bus_arrival_time(route_number, stop_number)
    http_methods = "GetNextTripsForStop"
    next_bus_key = "AdjustedScheduleTime";

    response = make_api_call(http_methods, route_number, stop_number)
    value = response.string_between_markers("<#{next_bus_key}>", "</#{next_bus_key}>")
    value = value.to_i

    arrival_to_sentence(route_number, value)
  end

  def arrival_to_sentence(route_number, value)
    if value > 0
      "🚍 #{route_number} arriving in #{value} #{pluralize(value, 'minute')}"
    else
      "😕 No busses are running"
    end
  end

  def pluralize(value, string)
    if value > 1
      string + 's'
    else
      string
    end
  end
end

class String
  def string_between_markers(front, back)
    self[/#{Regexp.escape(front)}(.*?)#{Regexp.escape(back)}/m, 1]
  end
end

traveller = Traveller.new

output = traveller.get_next_bus_arrival_time(HARD_CODED_ROUTE_NUMBER, HARD_CODED_STOP_NUMBER)

puts output
