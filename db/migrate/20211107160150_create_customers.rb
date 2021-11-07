class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false, limit: 255
      t.string :cnpj, null: false, limit: 255, unique: true
      t.string :email, null: false, limit: 255

      t.timestamps
    end
  end
end
