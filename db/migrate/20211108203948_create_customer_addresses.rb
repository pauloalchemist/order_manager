class CreateCustomerAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_addresses do |t|
      t.string :address, null: false, limit: 255
      t.integer :number, null: false
      t.string :district, null: false, limit: 255
      t.string :zipcode, null: false, limit: 255
      t.references :customer, foreign_key: true, null: false
      t.references :cities, foreign_key: true, null: false
      t.references :states, foreign_key: true, null: false 
      t.timestamps
    end
  end
end
