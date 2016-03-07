require 'oystercard'

describe Oystercard do

	it 'intial balance on oystercard should be 0' do
 	  expect(subject.balance).to eq 0
  end

  it 'top-up method increasing balance by value' do
  	subject.top_up(20)
  	expect(subject.balance).to eq 20
  end

end
