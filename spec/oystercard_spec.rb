require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}
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

    describe '#deduct' do
      it 'decreases balance by fare' do
        expect { oystercard.deduct(5) }.to change{ oystercard.balance }.by(-5)
      end
    end
  end

  describe '#top_up' do
    it 'increases balance by given amount' do
      expect { oystercard.top_up(8) }.to change{ oystercard.balance }.by(8)
    end
  end

end
