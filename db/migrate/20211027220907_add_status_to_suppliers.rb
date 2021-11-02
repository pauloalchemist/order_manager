class AddStatusToSuppliers < ActiveRecord::Migration[6.1]
  def change
    add_column :suppliers, :status, :integer, null: false, default: 0
  end
end
