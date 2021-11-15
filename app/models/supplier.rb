require 'cpf_cnpj'

class Supplier < ApplicationRecord
  before_validation :valid_cnpj

  enum status: %i[active inactive], _default: :active

  validates :corporate_name, :cnpj, presence: true

  has_many :supplier_addresses, inverse_of: :supplier
  accepts_nested_attributes_for :supplier_addresses

  private

  def check_cnpj(cnpj)
    number = CNPJ.new(cnpj)
    number.formatted if number.valid?
  end

  def valid_cnpj
    self.cnpj = check_cnpj(cnpj)
  end
end
