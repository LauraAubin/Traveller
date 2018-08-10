class NextTravelLocation
  def initialize
    @next_destination = PARSE_TIMETABLE.surface_next_destination
  end

  def get_travel_location
    index_of_place = 0

    return "🚍 ➡ #{@next_destination[index_of_place]}"
  end

  def self.run
    new.get_travel_location
  end
end
