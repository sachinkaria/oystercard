class Oystercard

  attr_reader :balance, :in_journey

  MAX_AMOUNT = 90
  MIN_AMOUT = 1
  MAX_ERROR = "Cannot exceed max balance £#{MAX_AMOUNT}"
  MIN_ERROR = "You need to have at least £#{MIN_AMOUT}"

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    in_journey
  end

  def touch_in
    raise MIN_ERROR unless balance > MIN_AMOUT
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
