# require_relative 'lib/station.rb'
require_relative '../lib/oystercard.rb'
require_relative '../lib/journey.rb'

oys = Oystercard.new
oys.top_up 15
oys.touch_in("Euston") # station should be optional

oys.touch_out("Highbury & Islington")

p oys.journeys

# station should be optional

oys.touch_out("Highbury & Islington")

p oys.journeys
