require_relative 'oystercard'

class Journey

attr_reader :entry_station, :exit_station, :journeys

def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def in_journey?
    @entry_station != nil ? true : false
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
    record_journey
    @entry_station = nil
  end

  def record_journey
    journey = {:entry_station=> @entry_station, :exit_station => @exit_station}
    @journeys << journey
  end

  end