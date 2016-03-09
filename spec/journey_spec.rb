require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:euston) { double :station }

  it { is_expected.to respond_to(:entry_station) }

  it { is_expected.to respond_to(:exit_station) }

  describe "#start_journey" do
    it 'should store entry_station' do
      journey.start_journey(euston)
      expect(journey.entry_station).to eq euston
    end
  end

  describe "#complete_journey" do
    it 'should store exit_station' do
      journey.complete_journey(euston)
      expect(journey.exit_station).to eq euston
    end
  end
end
