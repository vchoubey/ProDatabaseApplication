class Api::YellowController < ApplicationController
  @@client = YellowApi.new(:apikey => "vrv3r9mawktxugqndm3tbkfc", :sandbox_enabled => true)

  def self.find_business options
    @@client.find_business(options[:what], options[:where])
  end
  
  def self.get_bussiness_detail options
    @@client.get_business_details(options[:prov], options[:name], options[:ref_id])
  end
end
