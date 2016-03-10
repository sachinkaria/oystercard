class JourneyLog
attr_reader :journey
  def initialize(journey_class = Journey)
    @journey = journey_class
  end

  def start(station)
    @journey.new(station)
  end

  def finish(station)
    @journey.complete_journey(station)
  end

  def journeys
    journey_history.dup
  end

private
  def journey_history
    @journey_history = []
  end

  def current_journey
    @journey.nil? ? @journey.new : @journey
  end
end
