require 'journey'

describe Journey do
  subject(:journey) { described_class.new }

  describe '#initialize' do
    it 'initialize entry station' do
      expect(journey.entry_station).to eq nil
    end

    it 'journey starts with no exit station' do
      expect(journey.exit_station).to eq nil
   end
  end

  describe '#entry_station' do
    it 'changes entry_station' do
      expect(journey.entry_st("Victoria")).to eq "Victoria"
    end
  end

  describe '#exit_station' do
    it 'changes exit_station' do
      expect(journey.exit_st("Bank")).to eq "Bank"
    end
  end

  describe '#record_journey' do
    it 'saves journeys as a hash' do
      journey.entry_st("Victoria")
      journey.exit_st("Bank")
      expect(journey.record_journey).to eq ({:entry_station => "Victoria", :exit_station => "Bank"})
    end
  end



end
