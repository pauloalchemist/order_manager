require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'associations' do
    it { should belong_to(:state).with_foreign_key('states_id') }
  end
end
