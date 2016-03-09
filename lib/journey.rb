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


  def fare
    if penalty_fare == true
      PENALTY_FARE
    else
      MIN_VALUE
    end
  end

  def penalty_fare
    if @entry_station != nil && @exit_station == nil || @entry_station == nil && @exit_station != nil
      true
    end
  end

end
