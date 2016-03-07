require 'oystercard'

describe Oystercard do

	it 'intial balance on oystercard should be 0' do
 	expect(subject.balance).to eq 0
end

end
