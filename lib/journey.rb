class Journey

  attr_reader :entry_station, :exit_station

  PENALTY_FARE = 6
  MAX_VALUE = 90
  MIN_VALUE = 1

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def entry_st(station)
    @entry_station = station
  end

  def exit_st(station)
    @exit_station = station
  end

  def record_journey
    journey_record = {:entry_station=> @entry_station, :exit_station => @exit_station}
  end

  def fare
    if (@journey.entry_station = nil && @journey.exit_station != nil) || (@journey.entry_station != nil && @journey.exit_station = nil)
    PENALTY_FARE
    else
    MIN_VALUE
    end
  end

end
