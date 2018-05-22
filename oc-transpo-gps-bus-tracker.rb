class Traveller
  def make_api_call(http_methods, route_number, stop_number)
    travel_info = open("https://api.octranspo1.com/v1.2/#{http_methods}?appID=#{APP_ID}&apiKey=#{APP_KEY}&routeNo=#{route_number}&stopNo=#{stop_number}").read
  end

  def get_next_bus_arrival_time(route_number, stop_number)
    response = make_api_call(NEXT_TRIPS_FOR_STOP, route_number, stop_number)
    value = response.string_between_markers("<#{TIME_TO_ARRIVAL}>", "</#{TIME_TO_ARRIVAL}>")
    value = value.to_i

    arrival_to_sentence(route_number, value)
  end

  def arrival_to_sentence(route_number, value)
    if value > 0
      "🚍 #{route_number} arriving in #{value} #{STRING::pluralize(value, 'minute')}"
    else
      "😕 No busses are running"
    end
  end
end
