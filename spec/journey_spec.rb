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
      expect(journey.entry_station("Victoria")).to eq "Victoria"
    end
  end

  describe '#exit_station' do
    it 'changes exit_station' do
      expect(journey.exit_station("Bank")).to eq "Bank"
    end
  end



end
