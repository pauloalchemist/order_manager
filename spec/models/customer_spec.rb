require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { build(:customer) }

  context 'test customer creation' do
    it { expect(customer).to be_valid }
    it { expect(customer.active?).to be true }
  end
end
