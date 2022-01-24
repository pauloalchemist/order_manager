# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomerAddress, type: :model do
  let(:customer_address) { build(:customer_address) }

  context 'test customer_address factory' do
    it { expect(customer_address).to be_valid }
  end

  context 'validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:district) }
    it { should validate_presence_of(:zipcode) }
  end

  context 'associations' do
    it { should belong_to(:customer) }
  end
end
