class Oystercard

  attr_reader :balance, :entry_station, :journeys

  MAX_AMOUNT = 90
  MIN_FARE = 1
  MAX_ERROR = "Cannot exceed max balance £#{MAX_AMOUNT}"
  MIN_ERROR = "You need to have at least £#{MIN_FARE}"

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(entry_station)
    raise MIN_ERROR unless balance > MIN_FARE
    @entry_station = entry_station
    @in_journey = true
  end

  def touch_out(exit_station)
    @in_journey = false
    deduct(MIN_FARE)
    set_journey(entry_station,exit_station)
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def set_journey(entry_station,exit_station)
    @journeys << { entry_station => exit_station }
  end
end
