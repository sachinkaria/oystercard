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
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def touch_in(station)
    if @journey_log.current_journey.in_progress?
      deduct(@journey_log.current_journey.fare)
      @journey_log.store_journey
    end if
    raise MIN_ERROR unless balance > MIN_FARE
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.current_journey.fare)
    @journey_log.store_journey
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
