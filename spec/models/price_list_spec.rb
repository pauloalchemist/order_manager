# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceList, type: :model do
  let(:price_list) { build(:price_list) }

  context 'test price_list factory' do
    it { expect(price_list).to be_valid }
  end

  context 'associations' do
    it { should belong_to(:product) }
  end

  context 'validations' do
    it { should validate_presence_of(:price) }
  end
end
