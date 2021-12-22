# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Suppliers', type: :request do
  let(:user) { create(:user) }

  describe 'GET suppliers#index' do
    before do
      sign_in(user)
      get suppliers_path
    end
    context 'when the user is logged in' do
      it { should render_template(:index) }
    end
    it 'should response status code 200' do
      expect(response.status).to eq(200)
    end
  end
end
