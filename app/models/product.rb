# frozen_string_literal: true

class Product < ApplicationRecord
  enum status: %i[active inactive], _default: :active

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :sku, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :supplier
  has_many :price_lists, inverse_of: :product, dependent: :delete_all
  accepts_nested_attributes_for :price_lists
end
