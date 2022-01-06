# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }

  context 'test product factory' do
    it { expect(product).to be_valid }
  end

  describe 'associations' do
    it { should belong_to(:supplier) }
    it { should have_many(:price_lists) }
    it { should accept_nested_attributes_for(:price_lists) }
  end

  describe 'validations' do
    it { should validate_presence_of(:sku) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:description).is_at_least(10) }
  end
end
