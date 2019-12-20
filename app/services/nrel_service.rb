class NrelService
  def get_nearest_station(address)
    response = fetch_data("/api/alt-fuel-stations/v1/nearest.json?location=#{address}&limit=1")
    parse_data(response)[:fuel_stations]
  end

  private

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_data(url)
    connection.get(url)
  end

  def connection
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['NREL_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
