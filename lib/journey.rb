class Journey
  attr_reader :entry_station, :exit_station

  def start_journey(station)
    @entry_station = station
  end

  def complete_journey(station)
    @exit_station = station
  end
end
