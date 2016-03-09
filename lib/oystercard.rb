require_relative 'station'
require_relative 'journey'

class Oystercard
  MAX_VALUE = 90
  MIN_VALUE = 1

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
     @journey.entry_st(station)
  end

  def touch_out(station)
    @journey.exit_st(station)
    record_journey
    @journey = Journey.new
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

    # def deduct(fare)
    #   @balance -= fare
    # end

    def record_journey
      @journeys << @journey.record_journey
    end

end
