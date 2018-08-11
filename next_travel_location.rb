class NextTravelLocation
  def initialize
    @next_destination = PARSE_TIMETABLE.surface_next_destination
    @today = Date.today.strftime('%A').downcase
  end

  def get_travel_location
    return nil if MyTimetable.public_send(@today).nil?

    index_of_place = 0

    "🚍 ➡ #{@next_destination[index_of_place]}"
  end

  def self.run
    new.get_travel_location
  end
end
