# frozen_string_literal: true

class Supplier < ApplicationRecord
  before_validation :valid_cnpj

  enum status: %i[active inactive], _default: :active

  validates :corporate_name, :cnpj, presence: true

  has_many :supplier_addresses, inverse_of: :supplier
  has_many :products, inverse_of: :supplier
  accepts_nested_attributes_for :supplier_addresses

  private

  def valid_cnpj
    self.cnpj = CheckCnpj.formatted(cnpj)
    errors.add(:cnpj, 'inválido') unless CheckCnpj.isvalid(cnpj)
  end
end
