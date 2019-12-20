class SearchController < ApplicationController
  def index
    station_facade = NrelFacade.new(params[:location])
    render locals: {
      search_results: station_facade,
      directions: MapFacade.new(params[:location],
         station_facade.nearest_station.address)
    }
  end
end
