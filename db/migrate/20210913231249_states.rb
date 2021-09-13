class States < ActiveRecord::Migration[6.1]
  create_table :states do |t|
    t.string :name, unique: true, null: false
  end
end
