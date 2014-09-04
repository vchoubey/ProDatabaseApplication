module ListingHelper
  def compare(listing, new_search)

    if listing.name != "Re/max Penticton Realty"
      Yellow.get_detail_product_categories listing
    end
    ecp_detail = PublicsController.get_corporation_details new_search
    
    if !listing.detail.blank?
      ecp_detail.suite == listing.detail.suite && 
      ecp_detail.street == listing.detail.street &&
      ecp_detail.city == listing.detail.city &&
      ecp_detail.province == listing.detail.province &&
      ecp_detail.work_phone == listing.detail.work_phone &&
      ecp_detail.postal == listing.detail.postalCode &&
      ecp_detail.fax == listing.detail.fax
    else 
      "not enough details"
    end

  end
end