# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do
  let(:user) { create(:user) }

  describe 'GET dashboards#dash' do
    before do
      sign_in(user)
      get '/dashboard'
    end

    context 'when the user is logged in' do
      it { should render_template(:dash) }

      it 'should response status code 200' do
        expect(response.status).to eq(200)
      end
    end

    context 'when the user is logged out' do
      it 'should redirect to login page for anonymous user' do
        sign_out(user)
        get '/dashboard'
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
