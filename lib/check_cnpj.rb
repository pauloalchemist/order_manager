module CheckCnpj
  def self.formatted(cnpj)
    number = CNPJ.new(cnpj)
    number.formatted
  end

  def self.isvalid(cnpj)
    CNPJ.valid?(cnpj)
  end
end
