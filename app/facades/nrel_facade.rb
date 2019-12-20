class NrelFacade
  def initialize(address)
    @address = address
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
end
