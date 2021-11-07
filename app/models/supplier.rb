class Supplier < ApplicationRecord
  enum status: %i[active inactive], _default: :active

  validates :corporate_name, :cnpj, presence: true

  has_many :supplier_addresses, inverse_of: :supplier
  accepts_nested_attributes_for :supplier_addresses
end
