class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false, limit: 255
      t.string :cnpj, null: false, limit: 255, index: { unique: true }
      t.string :email, null: false, limit: 255
      t.integer :status, null: false, default: 0 

      t.timestamps
    end
  end
end
