class Yellow

  def self.get_summary_detail_content (what, where)

    business_info = Api::YellowController.find_business(what, where)
   
    if !business_info.blank?  

      summary = business_info.summary
      @search = SearchRequest.find_by(what: summary.what, where: summary.where)

      #business_info.listings.each do |yellow_listing|
      1.times do |i|
        yellow_listing = business_info.listings[i]        
        puts "printing id: #{yellow_listing.inspect}"
        if !yellow_listing.blank?
          listing = Listing.find_by(ref: yellow_listing.id)
          puts "listing : #{listing}"
          puts "listing is blank : #{!listing.blank?}"
          unless !listing.blank?
            listing = Listing.create do |l|
              l.ref = yellow_listing.id
              l.name = yellow_listing.name
              l.prov = yellow_listing.address.prov
            end
            listing.save
        
            puts "print list: #{listing.inspect}"
            #listing.update_attributes permit_listing_options(listing_options)
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
                                                          
            
            unless !@search.blank?
              @search = SearchRequest.create do |s|
                s.what = summary.what
                s.where = summary.where
                s.firstListing = summary.firstListing
                s.lastListing = summary.lastListing
                s.totalListing =summary.totalListings
                s.pageCount = summary.pageCount
                s.currentPage = summary.currentPage
                s.listingPerPage = summary.listingPerPage
                s.prov = summary.Prov
              end
              @search.save
              
            end
            listing.search_requests << @search
            puts "@SEARCH : #{@search}"  
            sleep(2)
          end
        end
      end 
    else 

      listing = Listing.find_by(name: what)
      if listing.blank?
        listing = Listing.create do |l|
          l.name = what
        end
      end
      listing.save
      @search = SearchRequest.find_by(what: what)
      if @search.blank?
        @search = SearchRequest.create do |s|
          s.what = what
        end
        @search.save
      end

      listing.search_requests << @search  
      sleep(2)    
    end


    return @search
  end

  def self.get_detail_product_categories options
   
    if !options[:ref].blank? && !options[:name].blank? && !options[:prov].blank?
      name_of_business = Detail.find_by(name: options[:name]) 
     
      if(name_of_business.blank?)
    
        business_detail = Api::YellowController.get_business_details options
        lis = Listing.find_by(ref: business_detail.id) 
      else
        lis = Listing.find_by(name: options[:name])
      end
      #det =lis.detail


      #det = Detail.where(listing: lis)
      #puts "list in get_detail_product_categories : #{lis.inspect}"
      #puts "det in get_detail_product_categories : #{det.inspect}"

      if !lis.detail.blank? && !business_detail.blank?
        lis.detail = Detail.create do |d|
          d.listing = lis
          d.name = business_detail.name
          street = business_detail.address.street
          if street.scan(/-/).blank?
            d.suite = ""
            d.street = street
          else
            arr = street.split("-")
            d.suite = arr[0]
            d.street = arr[1]
          end
          d.province = business_detail.address.prov
          d.city = business_detail.address.city
          d.postalCode = business_detail.address.pcode
          if !business_detail.geo_code.blank?
            d.latitude = business_detail.geo_code.latitude
            d.longitude = business_detail.geo_code.longitude
          end
          business_detail.phones.each do |phone|
            if phone.type == "primary"
              d.work_phone = phone.disp_num
            end
            if phone.type == "fax"
              d.fax = phone.disp_num
            end
          end      
        end 
        lis.save
          
        # product = Product.find_or_create_by(listing: list) do |p|
          #   p.video = business_detail.products.videos
          #   p.photo = business_detail.products.photos
          #   p.profile = business_detail.products.profiles
          #   p.dspAd = business_detail.products.dispAd
          #   p.logo = business_detail.logos
          #   p.url = business_detail.products.webUrl
          # end
             
          # numberOfCategory = business_detail.categories.count
          # numberOfCategory.times do |m|
          #   cat = Category.find_or_create_by(name: business_detail.categories[m].name) do |c|
          #     c.isSensitive = business_detail.categories[m].isSensitive
          #   end
          #   list.categories << cat
          # end 
        sleep(1)
      end
    end

  end

  private 
    def self.permit_listing_options options
       options.require('listing').permit :ref_id
    end
end
