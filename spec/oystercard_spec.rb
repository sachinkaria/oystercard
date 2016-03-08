require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  let(:station) { double :station }

  describe '#balance' do
    it 'checks that it has a balance' do
      expect(oystercard.balance).to eq 0
    end
  end

  context 'when is topped up' do
    before { oystercard.top_up(described_class::MAX_AMOUNT) }

    describe '#top_up' do
      it 'raises' do
        error = described_class::MAX_ERROR
        expect { oystercard.top_up 1 }.to raise_error error
      end
    end

    describe '#in_journey?' do

      it 'starts out not in journey' do
        expect(oystercard).to_not be_in_journey
      end
    end

    context 'when has touched in' do
      before :each do
        oystercard.touch_in station
      end

      describe '#touch_in' do
        it 'puts in journey' do
          expect(oystercard).to be_in_journey
        end

        it 'sets entry station' do
          expect(oystercard.entry_station).to eq station
        end
      end

      describe '#touch_out' do
        it 'takes out of journey' do
          oystercard.touch_out
          expect(oystercard).not_to be_in_journey
        end

        it 'deducts minimum fare' do
          min_fare = described_class::MIN_FARE
          expect{ oystercard.touch_out }.to change{ oystercard.balance }.by(-min_fare)
        end
      end
    end
  end

  context 'when not topped up' do
    describe '#top_up' do
      it 'increases balance by given amount' do
        expect { oystercard.top_up(8) }.to change{ oystercard.balance }.by(8)
      end
    end

    describe '#touch_in' do
      it 'raises error' do
        error = described_class::MIN_ERROR
        expect{ oystercard.touch_in station }.to raise_error error
      end
    end
  end

end
