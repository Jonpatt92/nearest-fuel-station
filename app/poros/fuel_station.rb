class FuelStation
  def initialize(station_data)
    binding.pry
    @name = station_data[:station_name]
    @address = station_data[:street_address] + station_data[:zip]
    @fuel_type = station_data[:fuel_type_code]
    @access_times = station_data[:access_days_time]
    @distance = station_data[:distance]
  end
end
