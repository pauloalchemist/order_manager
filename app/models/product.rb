class Product < ApplicationRecord
  enum status: %i[active inactive], _default: :active

  belongs_to :supplier
end
