class Yellow

  def self.get_summary_detail_content params
    business_info = Api::YellowController.find_business params

    business_info.listings.each do |yellow_listing|
      puts "printing id: #{yellow_listing.id.inspect}"

      options = {listing:{ref_id: yellow_listing.id}}

      listing = Listing.find_or_create_by(options['listing']) do |l|
        l.name = yellow_listing.name
        l.prov = yellow_listing.address.prov
      end
      # listing.update_attributes permit_listing_options(listing_options)
      # detail = Detail.find_or_create_by(listing: list) do |d|
        #   d.listing_id = my_business.id
        #   d.name = my_business.name
        #   d.street = my_business.address.street
        #   d.province = my_business.address.prov
        #   d.postalCode = my_business.address.pcode
        #   d.latitude = my_business.geo_code.latitude
        #   d.longitude = my_business.geo_code.longitude
        #   d.distance = my_business.distance
        #   d.parentId = my_business.parentId
        #   d.isParent = my_business.isParent
        # end 
        # content = Content.find_or_create_by(listing: list) do |l|
        #   l.video_avail = my_business.content.Video.avail
        #   l.video_inMkt = my_business.content.Video.inMkt
        #   l.photo_avail = my_business.content.Photo.avail
        #   l.photo_inMkt = my_business.content.Photo.inMkt
        #   l.profile_avail = my_business.content.Profile.avail
        #   l.profile_inMkt = my_business.content.Profile.inMkt
        #   l.dspAd_avail = my_business.content.DspAd.avail
        #   l.dspAd_inMkt = my_business.content.DspAd.inMkt
        #   l.logo_avail = my_business.content.Logo.avail
        #   l.logo_inMkt = my_business.content.Logo.inMkt
        #   l.url_avail = my_business.content.Url.avail
        #   l.url_inMkt = my_business.content.Url.inMkt
        # end
  
      summary = business_info.summary
      options = {summary:{what: summary.what, where: summary.where}}
      search = SearchRequest.find_or_create_by(options['summary']) do |s|
        s.firstListing = summary.firstListing
        s.lastListing = summary.lastListing
        s.totalListing =summary.totalListings
        s.pageCount = summary.pageCount
        s.currentPage = summary.currentPage
        s.listingPerPage = summary.listingPerPage
        s.prov = summary.Prov
      end

      listing.search_requests << search
      sleep(1)
    end  
  end

  def self.get_detail_product_categories options

    business_detail = Api::YellowController.get_business_details options

    list = Listing.find_or_create_by(ref_id: businessDetail.id) 
    detail = Detail.find_or_create_by(listing: list) do |d|
      # d.listing_id = businessDetail.id
      d.name = businessDetail.name, 
      d.street = businessDetail.address.street,
      d.province = businessDetail.listing_address.prov,
      d.postalCode = businessDetail.address.pcode,
      d.latitude = businessDetail.geo_code.latitude,
      d.longitude = businessDetail.geo_code.longitude,
      d.npa = businessDetail.phones[0].npa,
      d.nxx = businessDetail.phones[0].nxx,
      d.num = businessDetail.phones[0].num        
    end 
    
    product = Product.find_or_create_by(listing: list) do |p|
      p.video = businessDetail.products.videos
      p.photo = businessDetail.products.photos
      p.profile = businessDetail.products.profiles
      p.dspAd = businessDetail.products.dispAd
      p.logo = businessDetail.logos
      p.url = businessDetail.products.webUrl
    end
       
    numberOfCategory = businessDetail.categories.count
    numberOfCategory.times do |m|
      cat = Category.find_or_create_by(name: businessDetail.categories[m].name) do |c|
        c.isSensitive = businessDetail.categories[m].isSensitive
      end
      list.categories << cat
    end
    sleep(1)
  end

  private 
    def self.permit_listing_options options
       options.require('listing').permit :ref_id
    end
end
