class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
    	t.references :listing
        t.integer :listing_id
    	t.string  :name
    	t.string  :street
    	t.string  :city
    	t.string  :province
    	t.string  :postalCode
    	t.float   :latitude
    	t.float   :longitude
    	t.float   :distance
    	t.integer :parentId
    	t.boolean :isParent
    	t.integer :npa
    	t.integer :nxx
    	t.integer :num
        t.text    :categories


      t.timestamps
    end
  end
end
