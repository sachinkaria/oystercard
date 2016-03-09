class Journey

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def entry(station)
    @entry_station = station
  end

  def exit(station)
    @exit_station = station
  end



end