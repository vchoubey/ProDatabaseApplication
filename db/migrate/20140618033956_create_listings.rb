class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :ref
      t.string :name
      t.string :prov

      t.timestamps
    end
  end
end
