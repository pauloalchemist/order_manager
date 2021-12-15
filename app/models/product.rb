class Product < ApplicationRecord
  enum status: %i[active inactive], _default: :active

  validates :name, :description, length: { minimum: 10 }, presence: true
  validates :sku, presence: true

  belongs_to :supplier
end
