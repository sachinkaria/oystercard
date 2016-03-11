require 'journey'

describe Journey do
  subject(:journey) { described_class.new}
  let(:euston) { double :station, name: "euston", zone: 1 }
  let(:lhr) { double :station, name: "heathrow", zone: 5 }


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

  describe "#complete?" do
    it "should return false when entry and exit stations nil" do
      expect(journey).not_to be_complete
    end

    it "should return false when entry nil and exit  not nil" do
      journey.complete_journey(euston)
      expect(journey).not_to be_complete
    end

    it "should return false when entry not nil and exit  nil" do
      journey.start_journey(euston)
      expect(journey).not_to be_complete
    end


    it "should return true when entry and exit stations not nil" do
      journey.start_journey(euston)
      journey.complete_journey(euston)
      expect(journey).to be_complete
    end
  end

  describe "#in_progress?" do
    it "should return false when entry and exit stations nil" do
      expect(journey).not_to be_in_progress
    end

    it "should return true when entry nil and exit  not nil" do
      journey.complete_journey(euston)
      expect(journey).to be_in_progress
    end

    it "should return true when entry not nil and exit  nil" do
      journey.start_journey(euston)
      expect(journey).to be_in_progress
    end


    it "should return false when entry and exit stations not nil" do
      journey.start_journey(euston)
      journey.complete_journey(euston)
      expect(journey).not_to be_in_progress
    end
  end


  describe "#fare" do
    it "hould calculate the fare from the entry and exit stations" do
      journey.start_journey(euston)
      journey.complete_journey(lhr)
      expect(journey.fare).to eq 5
    end

    it "should return 6 if the journey was incomplete" do
      expect(journey.fare).to eq described_class::PENALTY_FARE
    end
  end
end
