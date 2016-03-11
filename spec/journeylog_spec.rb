require 'journeylog'

describe JourneyLog do
  let(:station){ double :station }
  let(:journey){double :journey, complete?: true, start_journey: nil, complete_journey: nil, fare: nil}
  let(:journey_class){double :journey_class, new: journey}
  subject {described_class.new(journey_class: journey_class)}

  describe "#start" do
    it "starts a journey" do
      expect(journey).to receive(:start_journey).with(station = station)
      subject.start(station)
    end
  end

  describe "#finish" do
    it "finishes a journey" do
      expect(journey).to receive(:complete_journey).with(station = station)
      subject.finish(station)
    end
  end

  describe '#store_journey' do
    it 'stores a journey' do
      subject.current_journey
      subject.store_journey
      expect(subject.journeys).to include(journey)
    end
  end

  describe "#current_journey" do
    it "should create a new journey object" do
      expect(subject.current_journey).to eq journey
    end
  end

  describe "#initialize" do
    it "should initialize with an empty array" do
      expect(subject.journeys).to eq []
    end
  end
end
