class Oystercard

  attr_reader :balance
  MAX_ERROR = 'Cannot exceed max balance'
  MAX_AMOUNT = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end
end
