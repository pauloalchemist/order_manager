require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:supplier) { build(:supplier) }

  context 'test supplier' do
    it { expect(supplier).to be_valid }
    it { expect(supplier.active?).to be true }
  end
end
