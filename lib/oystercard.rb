require_relative 'station'
require_relative 'journey'

class Oystercard
  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE = 1
  attr_reader :balance
  attr_reader :journey

  def initialize(journey_class)
    @balance = 0
    @journey = journey_class.new
  end

  def top_up cash
    within_limit(cash)
    @balance += cash
  end

  def touch_in(entry_station)
    insufficient_funds
    journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    journey.end_journey(exit_station)
  end

  def deduct(fare)
    @balance -= fare
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

end
