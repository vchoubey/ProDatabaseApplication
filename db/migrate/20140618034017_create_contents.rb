class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :listing
      t.boolean :video_avail
      t.boolean :video_inMkt
      t.boolean :photo_avail
      t.boolean :photo_inMkt
      t.boolean :profile_avail
      t.boolean :profile_inMkt
      t.boolean :dspAd_avail
      t.boolean :dspAd_inMkt
      t.boolean :logo_avail
      t.boolean :logo_inMkt
      t.boolean :url_avail
      t.boolean :url_inMkt

      t.timestamps
    end
  end
end
