class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name, null: false
      t.string :fantasy_name, null: false, default: ''
      t.string :cnpj, null: false

      t.timestamps null: false
    end
  end
end
