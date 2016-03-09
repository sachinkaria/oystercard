class Journey

  attr_reader :entry_station, :exit_station

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


end
