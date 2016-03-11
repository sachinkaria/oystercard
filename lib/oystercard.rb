require_relative 'journeylog'
require_relative 'journey'

class Oystercard

  attr_reader :balance

  MAX_AMOUNT = 90
  MIN_FARE = 1
  MAX_ERROR = "Cannot exceed max balance £#{MAX_AMOUNT}"
  MIN_ERROR = "You need to have at least £#{MIN_FARE}"

  def initialize
    @balance = 0
    @journey = JourneyLog.new
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def touch_in(station)
    raise MIN_ERROR unless balance > MIN_FARE
    @journey.start(station)
  end

  def touch_out(station)
    @journey.finish(station)
    deduct(@journey.journeys[-1].fare)
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  # def log_journey
  #   deduct(@journey.fare)
  #   @journeys << @journey
  #   @journey = nil
  # end

end
