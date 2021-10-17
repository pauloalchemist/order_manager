require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:supplier) { build(:supplier) }

  context 'test supplier' do
    it 'has a valid supplier factory' do
      expect(supplier).to be_valid
    end
  end
end
