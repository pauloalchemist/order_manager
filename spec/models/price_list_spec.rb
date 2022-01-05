# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceList, type: :model do
  let(:price_list) { build(:price_list) }

  context 'test price_list factory' do
    it { expect(price_list).to be_valid }
  end

  context 'price_list factory is invalid' do
    it 'if price equals 0.00' do
      price_list.price = 0.00
      expect(price_list).to be_invalid
    end
  end

  context 'associations' do
    it { should belong_to(:product) }
  end

  context 'validations' do
    it { should validate_presence_of(:price) }
  end
end
