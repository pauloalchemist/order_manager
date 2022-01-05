# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceList, type: :model do
  describe 'associations' do
    it { should belong_to(:product) }
  end

  describe 'validations' do
    it { should validate_presence_of(:price) }
  end
end
