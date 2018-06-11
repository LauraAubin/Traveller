class Traveller
  def get_next_bus_arrival_time(route_number, stop_number)
    response = OC_TRANSPO_API.make_api_call(NEXT_TRIPS_FOR_STOP, route_number, stop_number)
    array_of_split_response = OC_TRANSPO_API.split_api_response(response, TIME_TO_ARRIVAL)

    arrival_time_and_status = traverse_array_for_real_time(array_of_split_response.drop(1))
    is_real_time = arrival_time_and_status[0]
    time_to_arrival = arrival_time_and_status[1]

    arrival_to_sentence(route_number, time_to_arrival, is_real_time)
  end

  def traverse_array_for_real_time(array)
    return 0 if array.count == 0

    output = [];

    array.each do |response_index|
      if is_real_time(response_index)
        output << true << response_index.string_between_markers(TIME_TO_ARRIVAL).to_i
        return output
      end
    end

    output << false << array[0].string_between_markers(TIME_TO_ARRIVAL).to_i
    return output
  end

  def busses_are_expected(time_to_arrival)
    time_to_arrival > 0
  end

  def is_real_time(response)
    adjustment_value = response.string_between_markers(ADJUSTMENT_AGE).to_f

    return true if adjustment_value > 0
    return false if adjustment_value < 0
  end

  def arrival_to_sentence(route_number, time_to_arrival, is_real_time)
    if !busses_are_expected(time_to_arrival)
      return "😕 No busses are running"
    end

    if is_real_time
      "🚍 #{route_number} arriving in #{time_to_arrival} #{STRING.pluralize(time_to_arrival, 'minute')}"
    else
      "🗓 #{route_number} scheduled in #{time_to_arrival} #{STRING.pluralize(time_to_arrival, 'minute')}"
    end
  end
end
