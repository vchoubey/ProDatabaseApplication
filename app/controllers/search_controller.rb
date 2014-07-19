class SearchController < ApplicationController

  def index
    @search = SearchRequest.all
  end

  def show
    @search = SearchRequest.new
  end

  def find_business
    sleep 2

    puts "HERE DEM PARAMS: #{params.inspect}"
    search = Yellow.get_summary_detail_content(search_request_params(params))

    respond_to do |format|
      format.html {redirect_to listings_url({what: search.what, where: search.where})}
      format.json {render json: business_info}
    end
  end

  def search_request_params params
    params.require(:search_request).permit(:what, :where)
  end
end
