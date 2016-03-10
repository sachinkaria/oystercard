class JourneyLog
attr_reader :journey
  def initialize(journey_class: )
    @journey_class = journey_class
    journey_history = []
  end
  def start(station)
  end
  def journeys
    journey_history.dup
  end

private
  def journey_history
    @journey_history = []
  end

  def current_journey
    @current_journey || journey_class.new
  end

  def log_journey
    @journey_history << @journey
  end
end
