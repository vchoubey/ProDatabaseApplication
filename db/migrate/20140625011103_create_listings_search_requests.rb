class CreateListingsSearchRequests < ActiveRecord::Migration
  def change
    create_table :listings_search_requests, :id => false do |t|
      t.references :listing
      t.references :search_request
    end
  end
end
