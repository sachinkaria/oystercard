require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  max_value = Oystercard::MAX_VALUE

  describe '#initialize' do
    it 'should initialize with a balance of 0' do
      expect(card.balance).to be_zero
    end
    it 'should have an empty list of journeys by default' do
      expect(card.journeys).to be_empty
    end
  end

  describe '#top_up' do
    it 'should top up with the provided credit' do
      expect{ card.top_up 1 }.to change{ card.balance }.by 1
    end

    it 'should raise error when exceeding limit' do
      message = "Limit of #{max_value} exceeded"
      expect{ card.top_up (max_value + 1) }.to raise_error message
    end
  end


  describe '#touch_in' do

    it 'raise error when touched in with insufficient balance' do
    	message = "You have an insufficicent balance"
    	expect{card.touch_in("Bank")}.to raise_error message
    end
    it 'sets entry_station to the station' do
      card.top_up(5)
      expect(card.touch_in("Bank")).to eq "Bank"
    end
    it 'deducts PENALTY_FARE if not touched out' do
      card.top_up(5)
      card.touch_in("Bank")
      expect{ card.touch_in("Victoria") }.to change{ card.balance }.by(-6)
    end
  end

  describe '#touch_out' do

    it 'should reduce the balance by minimum fare' do
      card.top_up(5)
      card.touch_in("Bank")
      expect{ card.touch_out("Victoria") }.to change{ card.balance }.by(-1)
    end
    it 'save journey after touch_out' do
      card.top_up(5)
      card.touch_in("Bank")
      card.touch_out("Victoria")
      expect(card.journeys).to eq [{:entry_station => "Bank", :exit_station => "Victoria"}]
    end

  end
end
