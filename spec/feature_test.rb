# require_relative 'lib/station.rb'
require_relative '../lib/oystercard.rb'
require_relative '../lib/journey.rb'

oys = Oystercard.new
oys.top_up 90
oys.touch_in("Euston") # station should be optional
oys.touch_out("Highbury & Islington") # 89
p oys.balance

p oys.journeys

# station should be optional

oys.touch_in("badaman")
oys.touch_out("ponys")  # 88
p oys.balance

oys.touch_out("future") # 82
p oys.balance

oys.touch_in("loudpack")
oys.touch_in("jamboree") # 76
p oys.balance

oys.touch_out("rainbow") # 75
p oys.balance

p oys.journeys
