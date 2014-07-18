class CreateSearchRequests < ActiveRecord::Migration
  def change
    create_table :search_requests do |t|
      t.string  :what
    	t.string  :where
    	t.integer :firstListing
    	t.integer :lastListing
    	t.integer :totalListing
    	t.integer :pageCount
    	t.integer :currentPage
    	t.integer :listingPerPage
    	t.string  :prov

      t.timestamps
    end
  end
end
