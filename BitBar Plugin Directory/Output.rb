#!/usr/bin/ruby

require_relative '../Config'

puts TRAVELLER::get_next_bus_arrival_time(HARD_CODED_ROUTE_NUMBER, HARD_CODED_STOP_NUMBER)
