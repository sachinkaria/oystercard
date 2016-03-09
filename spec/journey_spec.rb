require 'journey'

describe Journey do

  describe '#initialize' do
     journey = Journey.new
    it 'initialize entry station' do
      expect(journey.entry_station).to eq nil
    end

    it 'journey starts with no exit station' do
      expect(journey.exit_station).to eq nil
   end
  end



end
