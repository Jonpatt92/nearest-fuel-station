require './app/poros/route_step'

class MapFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_route_data
    @route_data ||= service.get_directions(@origin, @destination)
    binding.pry
  end

  def directions
    create_directions(get_route_data)
  end

  private

  def service
    MapService.new
  end

  def create_directions(route_steps)
    route_steps.map do |step

  end
end
