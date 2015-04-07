class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :city
      t.string :barangay
      t.integer :bathrooms
      t.string :condition
      t.integer :area
      t.string :neighborhood
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
