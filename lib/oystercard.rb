require_relative 'station'
require_relative 'journey'

class Oystercard
  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE = 1

  attr_reader :balance, :journeys


  def initialize
    @journey = Journey.new
    @balance = 0
    @journeys = []
  end

  def top_up(cash)
    within_limit(cash)
    @balance += cash
  end

  def touch_in(station)
     insufficient_funds
     @journey.entry(station)
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journey.exit(station)
    record_journey
  end


  private
  def within_limit(cash)
    message = "Limit of #{MAX_LIMIT} exceeded"
    raise message if (balance + cash) > MAX_LIMIT
  end

  def insufficient_funds
    message = "You have an insufficicent balance"
    raise message if balance < MIN_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

  def record_journey
    journey = {:entry_station=> @journey.entry_station, :exit_station => @journey.exit_station}
    @journeys << journey
  end

end
