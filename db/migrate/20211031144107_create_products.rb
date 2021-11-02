class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 255
      t.text :description, null: false  
      t.string :sku, null: false, limit: 50 
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
