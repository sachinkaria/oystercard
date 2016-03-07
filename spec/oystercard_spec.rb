require 'oystercard'

describe Oystercard do

	it 'intial balance on oystercard should be 0' do
 	  expect(subject.get_balance).to eq 0
  end

end
