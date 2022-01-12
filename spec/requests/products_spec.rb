# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { build(:user) }
  let(:supplier) { create(:supplier) }
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

      it 'should create a new product' do
        post '/products',
             params: { product: {
               name: product.name,
               description: product.description,
               sku: product.sku,
               supplier_id: supplier[:id],
               price_lists_attributes: { "0": { price: price_list.price } }
             } }

        expect(response).to redirect_to(assigns(:product))
        expect(flash[:notice]).to match(/Produto criado com sucesso./)
      end
    end
  end

  context 'when the user is logged out' do
    before do
      sign_out(user)
    end

    it 'should be redirected to login page' do
      get '/products/new'
      expect(response).to redirect_to new_user_session_path
    end
  end
end
