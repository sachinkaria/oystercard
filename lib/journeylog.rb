class JourneyLog

  attr_reader :journeys
  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def new_journey
    @journey_class.new
  end

  def start(station)
    @journeys << @journey_class.new(station)
    @journeys[-1]
  end
  #
  def finish(station)
    @journeys[-1].complete_journey(station)
    @journeys[-1]
  end

  def journeys
    journeys.dup
  end

  private

  def current_journey
    @current_journey || journey_class.new
  end

end
