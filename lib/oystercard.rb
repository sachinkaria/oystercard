class Oystercard

  attr_reader :balance, :in_journey

  MAX_AMOUNT = 90
  MIN_FARE = 1
  MAX_ERROR = "Cannot exceed max balance £#{MAX_AMOUNT}"
  MIN_ERROR = "You need to have at least £#{MIN_FARE}"

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def in_journey?
    in_journey
  end

  def touch_in
    raise MIN_ERROR unless balance > MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
