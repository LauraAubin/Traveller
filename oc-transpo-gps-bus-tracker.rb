class Traveller
  def make_api_call(http_methods, route_number, stop_number)
    travel_info = open("https://api.octranspo1.com/v1.2/#{http_methods}?appID=#{APP_ID}&apiKey=#{APP_KEY}&routeNo=#{route_number}&stopNo=#{stop_number}").read
  end

  def get_next_bus_arrival_time(route_number, stop_number)
    response = make_api_call(NEXT_TRIPS_FOR_STOP, route_number, stop_number)
    time_to_arrival = response.string_between_markers("<#{TIME_TO_ARRIVAL}>", "</#{TIME_TO_ARRIVAL}>").to_i
    is_real_time = is_real_time(response)

    arrival_to_sentence(route_number, time_to_arrival, is_real_time)
  end

  def busses_are_expected(time_to_arrival)
    time_to_arrival > 0
  end

  def is_real_time(response)
    adjustment_value = response.string_between_markers("<#{ADJUSTMENT_AGE}>", "</#{ADJUSTMENT_AGE}>").to_i

    return true if adjustment_value != -1
    return false if adjustment_value == -1
  end

  def arrival_to_sentence(route_number, time_to_arrival, is_real_time)
    if !busses_are_expected(time_to_arrival)
      return "😕 No busses are running"
    end

    if is_real_time
      "🚍 #{route_number} arriving in #{time_to_arrival} #{STRING::pluralize(time_to_arrival, 'minute')}"
    else
      "🗓 #{route_number} scheduled in #{time_to_arrival} #{STRING::pluralize(time_to_arrival, 'minute')}"
    end
  end
end
