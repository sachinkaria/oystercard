require 'journey'

describe Journey do
let(:card) {double :oystercard}
let(:card2) {double :oystercard}
let(:entry_station) {double :entry_station}
let(:exit_station) {double :exit_station}

before(:each) do
  allow(card).to receive(:top_up).and_return(5)
  allow(card).to receive(:touch_in).and_return(entry_station)
  # allow(card2).to receive(:touch_in).and_return(entry_station)
end

 describe '#in_journey?' do
    it 'should not be in journey on initialization' do
      allow(card).to receive(:in_journey?).and_return(false)
      expect(card).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'should change the status of the card to in_journey' do
      card.top_up(5)
      card.touch_in(entry_station)
      allow(card).to receive(:in_journey?).and_return(true)
      expect(card).to be_in_journey
    end

    it 'raise error when touched in with insufficient balance' do
      message = "You have an insufficicent balance"
      expect{subject.touch_in(entry_station)}.to raise_error message
    end

    it 'should save entry station to card' do
      card.top_up(5)
      card.touch_in(entry_station)
      expect(card.entry_station).to eq entry_station
    end
  end

  describe '#touch_out' do
    it 'should change the status of the card to not be in_journey' do
      card.top_up(5)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card).not_to be_in_journey
    end

    it 'should reduce the balance by minimum fare' do
      card.top_up(5)
      card.touch_in(entry_station)
      expect{ card.touch_out(exit_station) }.to change{ card.balance }.by(-1)
    end

    it 'should forget entry station when touched out' do
      card.top_up(5)
      card.touch_in(entry_station)
     expect{ card.touch_out(exit_station) }.to change{ card.entry_station}.to nil
    end
  end

  describe 'journeys' do
    it 'should have an empty list of journeys by default' do
      expect(card.journeys).to be_empty
    end

    it 'should create one journey after touching in and out' do
      card.top_up(5)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.journeys).to include journey
    end
  end
end