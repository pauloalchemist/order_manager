class SupplierAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :supplier_addresses do |t|
      t.string :address, null: false, limit: 255
      t.references :supplier, foreign_key: true, null: false
      t.integer :number, null: false
      t.string :district, null: false, limit: 255
      t.references :cities, foreign_key: true, null: false
      t.references :states, foreign_key: true, null: false 
      t.string :zipcode, null: false, limit: 255
      t.timestamps
    end
  end
end
