class CreateCategoriesListings < ActiveRecord::Migration
  def change
    create_table :categories_listings, :id => false do |t|
      t.references :listing
      t.references :category
    end
=begin
    add_index :categories_listings, [:category_id, :listing_id]
    add_index :categories_listings, :listing_id
=end

  end
end
