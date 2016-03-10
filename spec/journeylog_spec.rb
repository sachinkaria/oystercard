require 'journeylog'

describe JourneyLog do
<<<<<<< HEAD
  let(:station){ double :station }
  let(:journey){double :journey, complete?: true}
  let(:journey_class){double :journey_class, new: journey}
  subject {described_class.new(journey_class: journey_class)}

  describe "#start" do
    it "starts a journey" do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end
  end
=======

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


>>>>>>> 3f4981ed0535c330ccfacd3f1a5ac1e9da59463f
end
