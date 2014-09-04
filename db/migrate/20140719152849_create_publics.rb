class CreatePublics < ActiveRecord::Migration
  def change
    create_table :publics do |t|
      t.string :name
      t.string :suite
      t.string :street
      t.string :city
      t.string :province
      t.string :postal
      t.string :work_phone
      t.string :fax

      t.timestamps
    end
  end
end
