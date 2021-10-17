class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :corporate_name, null: false
      t.string :fantasy_name
      t.string :cnpj, null: false

      t.timestamps
    end
  end
end
