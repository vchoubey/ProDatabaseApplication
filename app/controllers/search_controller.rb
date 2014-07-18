class SearchController < ApplicationController

  def index
    @search = SearchRequest.all
  end

  def show
    @search = SearchRequest.new
  end

  def find_business
    sleep 2

    Yellow.get_summary_detail_content search_request_params

    respond_to do |format|
      format.html {redirect_to listings_url}
      format.json {render json: business_info}
    end
  end

  def search_request_params
    params.require(:search_request).permit(:what, :where)
  end
end
