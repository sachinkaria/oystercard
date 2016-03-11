require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new(journeylog: journeylog)}
  let(:z1) { double :station, name: "z1", zone: 1}
  let(:z2) { double :station, name: "z2", zone: 2}
  let(:journeylog){double :journeylog, start: nil, finish: nil, store_journey: nil, journeys: nil, current_journey: journey}
  let(:journey){double :journey, start_journey: nil, complete_journey: nil, complete?: nil, in_progress?: nil, fare: 1 }

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

    context 'when has touched in' do
      before :each do
        card.touch_in(z1)
      end

      describe '#touch_out' do

        it 'deducts minimum fare' do
          allow(  journey).to receive(:fare).and_return(2)
          min_fare = described_class::MIN_FARE
          expect{ card.touch_out(z2) }.to change{ card.balance }.by(-(min_fare+1))
        end
      end
    end
  end

context 'incomplete journey' do

  it ' deducts penalty fare on double touch_in' do
    allow(journey).to receive(:fare).and_return(6)
    allow(journey).to receive(:in_progress?).and_return(true)
    card.top_up(described_class::MAX_AMOUNT)
    card.touch_in(z1)
    expect{card.touch_in(z1)}.to change{card.balance}.by(-6)
  end

    it ' deducts penalty fare on double touch_out' do
    allow(journey).to receive(:fare).and_return(6)
    allow(journey).to receive(:in_progress?).and_return(true)
    card.top_up(described_class::MAX_AMOUNT)
    expect{card.touch_out(z1)}.to change{card.balance}.by(-6)
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
        expect{ card.touch_in(z1) }.to raise_error error
      end
    end
  end

end
