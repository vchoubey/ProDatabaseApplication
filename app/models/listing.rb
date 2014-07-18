class Listing < ActiveRecord::Base
	has_one :detail
	has_one :content
	has_one :product
	has_and_belongs_to_many :search_requests
  has_and_belongs_to_many :categories
end
