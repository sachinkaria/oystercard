require 'journeylog'

describe JourneyLog do

  let(:journey){double :journey, entry_station: "euston"}
  describe "#initialize" do
    it "should initialize journey_class parameter" do
        expect(subject.journey).to eq Journey
    end
  end

  describe "#journeys" do
    it "should return an array of journeys" do
      expect(subject.journeys).to eq []
    end
  end

end
