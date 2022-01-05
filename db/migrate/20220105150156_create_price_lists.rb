class CreatePriceLists < ActiveRecord::Migration[6.1]
  def change
    create_table :price_lists do |t|
      t.decimal :price, precision: 5, scale: 2, null: false  
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
