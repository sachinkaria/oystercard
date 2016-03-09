require 'station'

describe Station do
  subject(:station) { described_class.new("Angel",2) }

  it 'knows the name of the station' do
    expect(station.name).to eq "Angel"
  end

  it 'knows the zone of the station' do
    expect(station.zone).to eq 2
  end

end
