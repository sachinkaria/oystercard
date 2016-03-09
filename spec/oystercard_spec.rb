require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  max_limit = Oystercard::MAX_LIMIT
  # let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  it 'should initialize with a balance of 0' do
    expect(card.balance).to be_zero
  end

  it 'should have a maximum limit' do
    expect(max_limit).to be_a Integer
  end

  describe '#top_up' do
    it 'should top up with the provided credit' do
      expect{ card.top_up 1 }.to change{ card.balance }.by 1
    end

    it 'should raise error when exceeding limit' do
      message = "Limit of #{max_limit} exceeded"
      expect{ card.top_up (max_limit + 1) }.to raise_error message
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

  end

  describe '#touch_out' do

    it 'should reduce the balance by minimum fare' do
      card.top_up(5)
      card.touch_in("Bank")
      expect{ card.touch_out("Victoria") }.to change{ card.balance }.by(-1)
    end

  end

  describe 'journeys' do
    it 'should have an empty list of journeys by default' do
      expect(card.journeys).to be_empty
    end

    it 'should save after touching in and out' do
      card.top_up(5)
      card.touch_in("Bank")
      card.touch_out("Victoria")
      expect(card.journeys).to eq [{:entry_station => "Bank", :exit_station => "Victoria"}]
    end
  end
end
