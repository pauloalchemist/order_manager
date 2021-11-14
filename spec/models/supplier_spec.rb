require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:supplier) { build(:supplier) }
  subject { supplier }

  context 'test supplier' do
    it { expect(supplier).to be_valid }
    it { expect(supplier.active?).to be true }

    describe 'validations' do
      it { should validate_presence_of(:corporate_name) }
      it { should validate_presence_of(:cnpj) }
    end
  end
end
