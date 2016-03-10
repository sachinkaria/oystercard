require 'journeylog'

describe JourneyLog do

  describe "#new_journey" do
    it "should create a new journey object" do
      expect(subject.new_journey).to be_an_instance_of Journey
    end
  end

  describe "#initialize" do
    it "should initialize with an empty array" do
      expect(subject.journeys).to eq []
    end
  end

  describe "#start" do
    it "should create a new journey object and set it's entry_station" do
      expect(subject.start("euston")).to be_an_instance_of Journey
    end
  end
  #
  describe "#finish" do
    it "should amend the exit station for the last object in journeys array" do
      subject.start("eustop")
      subject.finish("adr")
      expect(subject.finish("adr")).to be_an_instance_of Journey
    end
  end


end
