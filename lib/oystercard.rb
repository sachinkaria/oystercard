require_relative 'station'
require_relative 'journey'

class Oystercard
  MAX_VALUE = 90
  MIN_VALUE = 1

  attr_reader :balance, :journey_history


  def initialize
    @balance = 0
    @journey_history = []
    @incomplete_journey = nil
  end

  def top_up(cash)
    within_limit(cash)
    @balance += cash
  end

  def touch_in(station)
     insufficient_funds
     deduct(@journey.fare) if @incomplete_journey != nil
     @journey = Journey.new
     @incomplete_journey = station
     @journey.entry_st(station)
  end

  def touch_out(station)
    @journey = Journey.new if @incomplete_journey == nil
    @journey.exit_st(station)
    deduct(@journey.fare) if @incomplete_journey == nil
    record_journey
    deduct(@journey.fare) if @incomplete_journey != nil
    @incomplete_journey = nil
  end


    private
    def within_limit(cash)
      message = "Limit of #{MAX_VALUE} exceeded"
      raise message if (balance + cash) > MAX_VALUE
    end

    def insufficient_funds
      message = "You have an insufficicent balance"
      raise message if balance < MIN_VALUE
    end

    def deduct(fare)
      @balance -= fare
    end

    def record_journey
      @journey_history << @journey
    end

end
