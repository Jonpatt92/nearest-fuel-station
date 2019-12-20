class MapService
  def get_directions(origin, destination)
    response = fetch_data("/maps/api/directions/json?origin=#{origin}&destination=#{destination}")
    parse_data(response)[:routes][0][:legs][0][:steps]
  end

  private

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_data(url)
    connection.get(url)
  end

  def connection
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params[:key] = ENV['MAP_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
