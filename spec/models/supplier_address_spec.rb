require 'rails_helper'

RSpec.describe SupplierAddress, type: :model do
  describe 'associations' do
    it { should belong_to(:supplier) }
  end
end
