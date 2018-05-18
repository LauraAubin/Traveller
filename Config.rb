# For making http calls
require 'open-uri'

require_relative 'String'
require_relative 'oc-transpo-gps-bus-tracker.rb'

APP_ID = ""
APP_KEY = ""

HARD_CODED_ROUTE_NUMBER = "5"
HARD_CODED_STOP_NUMBER = "2466"

STRING = String.new
TRAVELLER = Traveller.new
