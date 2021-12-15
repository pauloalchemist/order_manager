require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:supplier) }
  end

  describe 'validations' do
    it { should validate_presence_of(:sku) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
