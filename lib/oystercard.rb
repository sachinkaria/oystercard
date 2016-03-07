class Oystercard
  DEFAULT_BALANCE = 0


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def get_balance
    balance
  end

private
  attr_reader :balance

end
