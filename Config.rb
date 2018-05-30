# For making http calls
require 'open-uri'

# Required files
require_relative 'String'
require_relative 'oc-transpo-api'
require_relative 'oc-transpo-gps-bus-tracker.rb'

# API config
APP_ID = "f45f8077"
APP_KEY = "f3d78fbf26c0991d5a3dbaad6057b637"

STRING = String.new
OC_TRANSPO_API = OC_Transpo_API.new
TRAVELLER = Traveller.new

# API getters
NEXT_TRIPS_FOR_STOP = "GetNextTripsForStop"

# API getter keys
TIME_TO_ARRIVAL = "AdjustedScheduleTime"
ADJUSTMENT_AGE = "AdjustmentAge"

HARD_CODED_ROUTE_NUMBER = "14"
HARD_CODED_STOP_NUMBER = "6403"
