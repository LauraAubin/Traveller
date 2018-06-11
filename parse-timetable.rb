class ParseTimetable
  def initialize
    @today = Date.today.strftime('%A').downcase
    @now = Time.now.strftime('%k.%M').to_f

    @start_time_index = 1
    @end_time_index = 2
  end

  def get_next_bus_arrival_time
    return "😴 No routes today" if MyTimetable.public_send(@today).nil?

    destinations_today = MyTimetable.public_send(@today)

    current_location_index = current_location_index(destinations_today)
    next_destination = get_next_destination(current_location_index, destinations_today)

    get_bus_arrivals(next_destination)
  end

  def current_location_index(destinations_today)
    destinations_today.each_with_index do |destination, index|
      return index if last_element(destinations_today, index)

      return index if @now.between?(destination[@start_time_index], destination[@end_time_index])

      next if destination[@start_time_index].nil? | destination[@end_time_index].nil?
    end
  end

  def last_element(destinations_today, index)
    index == (destinations_today.count) - 1
  end

  def get_next_destination(current_index, all_destinations)
    first_element = 0

    return all_destinations[first_element] if last_element(all_destinations, current_index)
    all_destinations[current_index + 1]
  end

  def get_bus_arrivals(destination)
    size_of_array = destination.count - 1
    bus_info_start_at_index = 3

    busses = destination[bus_info_start_at_index..size_of_array]
    number_of_provided_bus_info = 2

    trips = [];
    busses.each_slice(number_of_provided_bus_info) do |route_number, stop_number|
      trips << TRAVELLER.get_next_bus_arrival_time(route_number, stop_number)
    end

    return trips
  end

  def self.run
    new.get_next_bus_arrival_time
  end
end
