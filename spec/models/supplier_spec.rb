# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:supplier) { build(:supplier) }

  context 'test supplier' do
    it { expect(supplier).to be_instance_of(Supplier) }
    it { expect(supplier).to be_valid }
    it { expect(supplier.active?).to be true }
  end

  context 'validations' do
    it { should validate_presence_of(:corporate_name) }
    it { should validate_presence_of(:cnpj) }
  end

  context 'associations' do
    it { should have_many(:supplier_addresses) }
    it { should have_many(:products) }
    it { expect(supplier).to accept_nested_attributes_for(:supplier_addresses) }
  end

  context 'supplier is invalid' do
    it 'when cnpj is invalid' do
      supplier.cnpj = '00.000.000/0000-00'
      expect(supplier).to be_invalid
    end
    it 'when corporate name is blank' do
      supplier.corporate_name = ''
      expect(supplier).to be_invalid
    end
  end
end
