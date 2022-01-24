# frozen_string_literal: true

class Customer < ApplicationRecord
  enum status: %i[active inactive], _default: :active

  validates :name, :cnpj, :email, presence: true

  has_many :customer_addresses, inverse_of: :customer, dependent: :delete_all
  accepts_nested_attributes_for :customer_addresses
end
