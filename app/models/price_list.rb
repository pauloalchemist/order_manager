# frozen_string_literal: true

class PriceList < ApplicationRecord
  validates :price, presence: true, numericality: { greater_than: 0.00 }

  belongs_to :product
end
