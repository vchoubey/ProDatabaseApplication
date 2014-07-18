class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :listing
      t.text    :video
    	t.text    :photo
    	t.text    :profile
    	t.text    :dspAd
    	t.text    :logo
    	t.text    :url

      t.timestamps
    end
  end
end
