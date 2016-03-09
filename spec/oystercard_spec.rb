require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  let(:euston) { double :station }
  let(:lime_house) { double :station }

  describe '#balance' do
    it 'checks that it has a balance' do
      expect(card.balance).to eq 0
    end
  end

  context 'when is topped up' do
    before { card.top_up(described_class::MAX_AMOUNT) }

    describe '#top_up' do
      it 'raises' do
        error = described_class::MAX_ERROR
        expect { card.top_up 1 }.to raise_error error
      end
    end

    describe '#journeys' do
      it 'keeps track of journeys' do
        card.touch_in(lime_house)
        expect{ card.touch_out(euston) }.to change{ card.journeys.size }.by(1)
      end
    end

    context 'when has touched in' do
      before :each do
        card.touch_in euston
      end

      describe '#touch_out' do
        it 'deducts minimum fare' do
          min_fare = described_class::MIN_FARE
          expect{ card.touch_out lime_house }.to change{ card.balance }.by(-min_fare)
        end
      end
    end
  end

  context 'when not topped up' do
    describe '#top_up' do
      it 'increases balance by given amount' do
        expect { card.top_up(8) }.to change{ card.balance }.by(8)
      end
    end

    describe '#touch_in' do
      it 'raises error' do
        error = described_class::MIN_ERROR
        expect{ card.touch_in euston }.to raise_error error
      end
    end
  end

end
