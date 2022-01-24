# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomerAddress, type: :model do
  let(:customer_address) { build(:customer_address) }

  context 'test customer_address factory' do
    it { expect(customer_address).to be_valid }
  end
end
