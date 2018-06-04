class ParseTimetable
  def initialize
    @my_timetable = MyTimetable.new

    @today = Date.today.strftime('%A').downcase
    @now = Time.now.strftime('%k.%M').to_f

    @start_time_index = 1
    @end_time_index = 2
    @number_of_mandatory_fields = 3
  end

  def get_route_number
    return 0 if @my_timetable.public_send(@today).nil? # best place to put this? put in the initializer?

    destinations_today = MY_TIMETABLE.public_send(@today)
    
    current_location_index = current_location_index(destinations_today)
    current_location = destinations_today[current_location_index]
  end

  def current_location_index(destinations_today)
    destinations_today.each_with_index do |destination, index|
      return index if made_it_to_last_element(destinations_today, index)

      return index if @now.between?(destination[@start_time_index], destination[@end_time_index])

      next if destination[@start_time_index].nil? | destination[@end_time_index].nil?
    end
  end

  def made_it_to_last_element(destinations_today, index)
    index == (destinations_today.count) - 1
  end
end
