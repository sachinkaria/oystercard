require_relative 'journey'

class JourneyLog

  attr_reader :journeys
  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    current_journey
    @journey.start_journey(station)
  end
  #
  def finish(station)
    current_journey
    @journey.complete_journey(station)
  end

  def store_journey
    @journeys << @journey
    @journey = nil
  end

  def journeys
    @journeys.dup
  end

  def current_journey
    @journey ||= @journey_class.new
  end

end
