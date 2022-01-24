# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { build(:customer) }

  context 'test customer creation' do
    it { expect(customer).to be_valid }
    it { expect(customer.active?).to be true }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cnpj) }
    it { should validate_presence_of(:email) }
  end

  context 'associations' do
    it { should have_many(:customer_addresses) }
    it { expect(customer).to accept_nested_attributes_for(:customer_addresses) }
  end
end
