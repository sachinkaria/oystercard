require 'oystercard'

describe Oystercard do

	describe "#initialize" do
		it 'initial balance on oystercard should be 0' do
	 	  expect(subject.balance).to eq 0
	  end
	end

	describe "#top_up" do
	  it 'top-up method increasing balance by value' do
	  	expect{ subject.top_up(20) }.to change{ subject.balance }.by(20)
	  end
		it 'raises an error if top_up value causes card to exceed limit' do
			expect{ subject.top_up(91).balance > subject.class::CARD_LIMIT }.to raise_error("Exceeds card limit of £90.")
		end

	end

	describe "#reduce"do
		it 'reduces balance by specific amount' do
			subject.top_up(20)
			expect{subject.reduce(10)}.to change{subject.balance}.by(-10)
		end
	
	end

end
