class SearchController < ApplicationController

  def index
    @search = SearchRequest.all
  end

  def show
    #@search = SearchRequest.new
  end

  def find_business
    sleep 2

    puts "HERE DEM PARAMS: #{params.inspect}"
    #search = Yellow.get_summary_detail_content(search_request_params(params))

    respond_to do |format|
      if !params[:search_request].blank?
        flash[:info] = "Displaying #{params[:search_request][:what]}"
        format.html {redirect_to listings_url(what: params[:search_request][:what], where: params[:search_request][:where])}
        format.json {render json: business_info}
      else
        flash[:error] = "you are forgetting something!!!"
        format.html { render action: 'show' }
        
      end

    end
  end

  def search_request_params params
    params.require(:search_request).permit(:what, :where)
  end
end
