class SearchController < ApplicationController
  def index
    render locals: {
      search_results: NrelFacade.new(params[:location])
    }
  end
end
