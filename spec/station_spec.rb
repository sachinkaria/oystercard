require 'station'

describe Station do
  let(:angel){ described_class.new("Angel",2) }
  let(:arch){described_class.new("Archway",5)}

  it 'knows the name of the station' do
    expect(angel.name).to eq "Angel"
  end

  it 'knows the zone of the station' do
    expect(angel.zone).to eq 2
  end



end
