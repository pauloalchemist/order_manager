# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Suppliers', type: :request do
  let(:user) { create(:user) }
  let(:supplier) { create(:supplier) }

  describe 'GET suppliers#index' do
    before do
      sign_in(user)
      get suppliers_path
    end

    context 'when the user is logged in' do
      it { should render_template(:index) }

      it 'should response status code 200' do
        expect(response.status).to eq(200)
      end

      it 'should response status code 200 when render suppliers.pdf' do
        get '/suppliers.pdf'
        expect(response.status).to eq(200)
      end
    end

    context 'when the user is logged out' do
      it 'should response status code 401 when trying to render suppliers.pdf' do
        sign_out(user)
        get '/suppliers.pdf'
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'GET suppliers#show' do
    before do
      sign_in(user)
    end

    context 'when the user is logged in' do
      it 'status 200 when render /suppliers/id' do
        supplier = Supplier.create(supplier)

        get "/suppliers/#{supplier[:id]}"
        expect(response.status).to eq(200)
      end
    end
  end
end
