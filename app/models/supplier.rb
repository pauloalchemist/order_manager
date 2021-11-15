require 'cpf_cnpj'

class Supplier < ApplicationRecord
  before_create :valid_cnpj

  enum status: %i[active inactive], _default: :active

  validates :corporate_name, :cnpj, presence: true

  has_many :supplier_addresses, inverse_of: :supplier
  accepts_nested_attributes_for :supplier_addresses

  private

  def valid_cnpj
    cnpj_v = CNPJ.new(cnpj)
    cnpj_v.formatted
    raise 'CNPJ inválido. Tente novamente.' unless cnpj_v.valid?
  end
end
