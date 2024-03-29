class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
    	t.references :listing
        #t.integer :listing_id
    	t.string  :name
        t.string  :suite
    	t.string  :street
    	t.string  :city
    	t.string  :province
    	t.string  :postalCode
    	t.float   :latitude
    	t.float   :longitude
    	t.float   :distance
    	t.integer :parentId
    	t.boolean :isParent
    	t.string  :work_phone
    	t.string  :fax
        t.text    :categories


      t.timestamps
    end
  end
end
