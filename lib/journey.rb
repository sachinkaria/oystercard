class Journey
  attr_reader :entry_station, :exit_station

  MIN_FARE = 1
  PENALTY_FARE = 6
  def initialize(entry_station=nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def start_journey(station)
    @entry_station = station
  end

  def complete_journey(station)
    @exit_station = station
  end

  def complete?
    entry_station != nil && exit_station != nil
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end
end
