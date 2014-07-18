class ListingController < ApplicationController
  before_action :get_listing, only: [:get_business_detail]


  def index
    @listing = Listing.all
puts "PRINT Listings: #{@listing.inspect}"
  end

  def show
  end

  def get_business_detail
    sleep 1
    puts "entering into get_business_detail"
    Yellow.get_detail_product_categories @listing
    debugger
    respond_to do |format|
      format.html {render action: 'show'}
      format.json {render json: business_detail}
    end
  end

  def get_listing
    @listing = Listing.find(params[:id])
    puts "PRINTING params[:id]: #{@listing}"
  end

  def listing_params
     params.require(:listing).permit :ref_id
  end
end
