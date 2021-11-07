class Customer < ApplicationRecord
  enum status: %i[active inactive], _default: :active

  validates :name, :cnpj, :email, presence: true
end
