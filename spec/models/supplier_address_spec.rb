# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SupplierAddress, type: :model do
  let(:supplier_address) { build(:supplier_address) }

  context 'valid supplier_address factory' do
    it { expect(supplier_address).to be_valid }
  end

  context 'associations' do
    it { should belong_to(:supplier) }
  end

  context 'validations' do
    it { should validate_presence_of(:address) }
  end
end
