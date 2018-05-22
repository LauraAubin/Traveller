# For making http calls
require 'open-uri'

# Required files
require_relative 'String'
require_relative 'oc-transpo-gps-bus-tracker.rb'

# API config
APP_ID = ""
APP_KEY = ""

STRING = String.new
TRAVELLER = Traveller.new

# API getters
NEXT_TRIPS_FOR_STOP = "GetNextTripsForStop"

# API getter keys
TIME_TO_ARRIVAL = "AdjustedScheduleTime"

HARD_CODED_ROUTE_NUMBER = "104"
HARD_CODED_STOP_NUMBER = "3025"
