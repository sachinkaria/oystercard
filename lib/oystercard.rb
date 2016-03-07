class Oystercard
  DEFAULT_BALANCE = 0
  CARD_LIMIT = 90
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up (value)
    raise "Exceeds card limit of £#{CARD_LIMIT}." if @balance + value > CARD_LIMIT
  	@balance += value
  end

  # def get_balance
  #   balance
  # end

end
