class Product < ApplicationRecord
  enum status: %i[active inactive]

  belongs_to :supplier
end
