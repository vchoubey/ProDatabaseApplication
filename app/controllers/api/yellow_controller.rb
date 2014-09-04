class Api::YellowController < ApplicationController
  @@client = YellowApi.new(:apikey => "vrv3r9mawktxugqndm3tbkfc", :sandbox_enabled => true)

  def self.find_business(what, where)
    if !what.blank? && !where.blank?
      @@client.find_business(what, where)
    end
  end
  
  def self.get_business_details options
    puts "options : #{options[:ref]}"
    if !options[:prov].blank? && !options[:name].blank? && !options[:ref].blank?
      @@client.get_business_details(options[:prov], options[:name], options[:ref])
    end
  end
end
