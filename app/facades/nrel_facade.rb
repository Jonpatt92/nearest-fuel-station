require './app/poros/fuel_station'

class NrelFacade
  attr_reader :nearest_station

  def initialize(address)
    @address = address
    @nearest_station = nearest_station
  end

  def get_nearest_station_data
    @station_data ||= service.get_nearest_station(address)
  end

  def nearest_station
    create_station(get_nearest_station_data)
  end

  private
  attr_reader :address

  def service
    NrelService.new
  end

  def create_station(station_data)
    FuelStation.new(station_data[0])
  end
end
