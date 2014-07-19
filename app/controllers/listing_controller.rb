class ListingController < ApplicationController
  before_action :get_listing, only: [:get_business_detail, :show]
  

  def index 

    search = SearchRequest.find_by(what: params[:what], where: params[:where])
    @listing = search.listings.all
    
puts "PRINT @listings in index: #{@listing.inspect}"

  end

  def show
  end

  def get_business_detail
    sleep 1
    puts "entering into get_business_detail"
    Yellow.get_detail_product_categories @listing
    
    respond_to do |format|
      format.html {render action: 'show'}
      format.json {render json: business_detail}
    end
  end

  def get_listing
    @listing = Listing.find(params[:id])
    puts "PRINTING @listing in get_listing: #{@listing.inspect}"
  end

  # def get_search
  #   @search=SearchRequest.find(params[:id])
  # end

  # def listing_params
  #   params.require(:listing).permit(:ref, :name, :prov)
  # end
end
