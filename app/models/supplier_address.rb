# frozen_string_literal: true

class SupplierAddress < ApplicationRecord
  validates :address, presence: true, length: { minimum: 2 }

  belongs_to :supplier
end
