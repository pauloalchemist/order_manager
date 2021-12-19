require 'rails_helper'

RSpec.describe State, type: :model do
  describe 'associations' do
    it { should have_many(:cities).with_foreign_key('states_id') }
  end
end
