require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context 'test user' do
    it 'has a valid user factory' do
      expect(user).to be_valid
    end
  end
end
