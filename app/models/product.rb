class Product < ApplicationRecord
  enum status: %i[active inactive], _default: :active

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :sku, presence: true

  belongs_to :supplier
end
