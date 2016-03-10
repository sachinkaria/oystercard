class JourneyLog
attr_reader :journey
  def initialize(journey_class = Journey)
    @journey = journey_class
  end

  def start(station)
    log_journey unless @journey.nil?
    @journey.new(station)
  end

  def finish(station)
    current_journey
    @journey.complete_journey(station)
    log_journey
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

  def log_journey
    @journey_history << @journey
  end
end
