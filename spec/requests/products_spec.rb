# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { build(:user) }
  let(:supplier) { build(:supplier) }
  let(:product) { build(:product) }
  let(:price_list) { build(:price_list) }

  describe 'POST products#create' do
    context 'when the user is logged in' do
      before do
        sign_in(user)
      end

      it 'should render template new' do
        get '/products/new'
        expect(response).to render_template(:new)
      end
    end
  end
end
