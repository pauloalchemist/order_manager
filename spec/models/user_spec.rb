require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context 'test user' do
    it { expect(user).to be_valid }
    it { expect(user).to have_db_index(:email).unique(true) }
  end
end
