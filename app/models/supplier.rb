class Supplier < ApplicationRecord
  validates :corporate_name, :cnpj, presence: true
end
