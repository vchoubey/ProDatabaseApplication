class ListingController < ApplicationController
  before_action :get_listing, only: [:get_business_detail, :show, :update_ecp, :update_ecp_detail]
  

  def index 

    if params[:what] == 'corporations'
      @ecp_listing = PublicsController.get_corporations params[:where]
      @ecp_listing.each do |ecp|
        search = SearchRequest.find_by(what: ecp.name, where: ecp.city)
        if search.blank?
          sleep 1
          search= Yellow.get_summary_detail_content(ecp.name, ecp.city)
        end
      # if !search.blank?
        #   @listing = Listing.create name: ecp.name
        #   @listing.save
        #   search = SearchRequest.create what: ecp.name
        #   @listing.search_requests << search
        # end
      end
 
      @listing = Listing.where(prov: params[:where]).paginate(:page => params[:page], :per_page => 14)
      @new_search = @listing.first.search_requests.first.what 
      @previous_search = nil
    end 
  end

  def show
  end

  def get_business_detail
    sleep 1
    puts "entering into get_business_detail"
    #Yellow.get_detail_product_categories @listing

    @ecp_detail = PublicsController.get_corporation_details @listing.search_requests.first.what
     
    respond_to do |format|
      format.html {render action: 'show'}
      format.json {render json: business_detail}
    end
  end

  def update_ecp
debugger
    if !@listing.detail.blank?
      ecp_detail = PublicsController.get_corporation_details @listing.search_requests.first.what
      
      if !@listing.detail.suite.blank?
        ecp_detail.suite = @listing.detail.suite  
      end

      if !@listing.detail.street.blank?
        ecp_detail.street = @listing.detail.street 
      end

      if !@listing.detail.city.blank?
        ecp_detail.city = @listing.detail.city 
      end

      if !@listing.detail.province.blank?
        ecp_detail.province = @listing.detail.province 
      end

      if !@listing.detail.postalCode.blank?
        ecp_detail.postal = @listing.detail.postalCode
      end

      if !@listing.detail.work_phone.blank?
        ecp_detail.work_phone = @listing.detail.work_phone
      end 

      if !@listing.detail.fax.blank?
        ecp_detail.fax = @listing.detail.fax 
      end

      ecp_detail.save
      flash[:success] = "ecp_listing updated"
      redirect_to listing_url #, error: 'ecp_listing updated'
    else
      flash[:alert] = "not enough information to update the details"
      redirect_to listing_url#, notice: "not enough information to update the details"
    end
  end

  def update_ecp_detail 

    ecp_detail = PublicsController.get_corporation_details @listing.search_requests.first.what


    case params[:update_detail]
      when "suite&street"
        if !@listing.detail.suite?
          ecp_detail.suite = @listing.detail.suite
        end

        if !@listing.detail.street.blank?
          ecp_detail.street = @listing.detail.street 
        end
      when "city&province&postal"
        if !@listing.detail.city.blank?
          ecp_detail.city = @listing.detail.city
        end

        if !@listing.detail.province.blank?
          ecp_detail.province = @listing.detail.province 
        end

        if !@listing.detail.postalCode.blank?
          ecp_detail.postal = @listing.detail.postalCode
        end
      when "work_phone"
        ecp_detail.work_phone = @listing.detail.work_phone
      when "fax"
        ecp_detail.fax = @listing.detail.fax 
      else 
        error = "information is not in the record"
    end
    if error.blank?
      ecp_detail.save
      flash[:success] = "Updated"
    else
      flash[:error] = "Could not be Updated 'cause #{error}"
    end
    
    redirect_to listing_url

  end

  def update_all_ecp

    if params[:render_update].blank?
      @updates = params[:update_checkbox]
      @id = 0
      render "listing/update", collection: @updates and return
    else 
      province = nil
      params[:update_checkbox].each do |check|
        # new_search = PublicsController.get_corporation_details listing.search_requests.first.what
        # puts "PRINTING new_search: #{new_search.inspect}"
        # puts "PRINTING previous_search: #{previous_search.inspect}"
        # if new_search != previous_search
        #   puts "new_search != previous_searchs"
        #   previous_search = new_search

        listing = Listing.find_by_id(check)
        province =  listing.detail.province
        ecp_detail = PublicsController.get_corporation_details listing.search_requests.first.what
        # if !listing.detail.blank?

        #  if !listing.detail.suite.blank?
        #   ecp_detail.suite = listing.detail.suite  
        #  end
        #  ecp_detail.street = listing.detail.street 
        #  ecp_detail.city = listing.detail.city 
        #  ecp_detail.province = listing.detail.province 
        #  ecp_detail.postal = listing.detail.postalCode
        #  if !listing.detail.work_phone.blank?
        #   ecp_detail.work_phone = listing.detail.work_phone
        #  end
        #  if !listing.detail.fax.blank?
        #   ecp_detail.fax = listing.detail.fax
        #  end
        #  ecp_detail.save
        # end
        puts "PRINTING corporations: #{ecp_detail.inspect}"
      end
      respond_to do |format|
        flash[:success] =  'all the ecp_listing updated'
        format.html {redirect_to listings_url(what: "corporations", where: province) }
      end
      
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
