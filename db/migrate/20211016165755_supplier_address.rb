class SupplierAddress < ActiveRecord::Migration[6.1]
  def change
    create_table :supplier_address do |t|
      t.string :address, null: false, limit: 255
      t.references :suppliers, foreign_key: true, null: false
      t.integer :number, null: false
      t.string :district, null: false, limit: 255
      t.references :cities, foreign_key: true, null: false
      t.references :states, foreign_key: true, null: false 
      t.string :zipcode, null: false, limit: 255
      t.timestamps
    end
  end
end
