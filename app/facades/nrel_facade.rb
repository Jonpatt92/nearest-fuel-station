require './app/poros/fuel_station'

class NrelFacade
  def initialize(address)
    @address = address
  end

  def get_nearest_station_data
    @station_data ||= service.get_nearest_station(address)
  end

  def nearest_station
    create_stations(get_nearest_station_data)
  end

  private
  attr_reader :address

  def service
    NrelService.new
  end

  def create_stations(station_data)
    binding.pry
    station_data.map do |data|
      FuelStation.new(data)
    end
  end
end
