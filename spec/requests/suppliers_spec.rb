# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Suppliers', type: :request do
  let(:user) { create(:user) }
  let(:supplier) { create(:supplier) }
  let(:state) { create(:state) }
  let(:city) { create(:city) }

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
      before do
        sign_out(user)
      end

      it 'should response status code 401 when trying to render suppliers.pdf' do
        get '/suppliers.pdf'
        expect(response.status).to eq(401)
      end

      it 'should redirect to login page for anonymous user' do
        get '/suppliers'
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET suppliers#show' do
    context 'when the user is logged in' do
      before do
        sign_in(user)
      end

      it 'status 200 when render /suppliers/id' do
        get "/suppliers/#{supplier[:id]}"
        expect(response.status).to eq(200)
      end

      it 'status 200 when render /suppliers/id.pdf' do
        get "/suppliers/#{supplier[:id]}.pdf"
        expect(response.status).to eq(200)
      end
    end

    context 'when the user logged out' do
      before do
        sign_out(user)
      end

      it 'should redirect to login page when trying to access suppliers/id' do
        get "/suppliers/#{supplier[:id]}"
        expect(response).to redirect_to new_user_session_path
      end

      it 'should response status 401 when trying render /suppliers/id.pdf' do
        get "/suppliers/#{supplier[:id]}.pdf"
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'POST suppliers#create' do
    context 'when the user is logged in' do
      before do
        sign_in(user)
      end

      it 'should render template new' do
        get '/suppliers/new'
        expect(response).to render_template(:new)
      end

      it 'should create new supplier' do
        post '/suppliers',
             params: { supplier: { corporate_name: Faker::Company.name,
                                   fantasy_name: Faker::Fantasy::Tolkien.character,
                                   cnpj: Faker::Company.brazilian_company_number,
                                   supplier_addresses_attributes: { "0": { address: 'Rua v',
                                                                           number: 1,
                                                                           district: 'bairro',
                                                                           cities_id: city[:id],
                                                                           states_id: state[:id],
                                                                           zipcode: '44100-000' } } } }

        expect(response).to redirect_to(assigns(:supplier))
        expect(flash[:notice]).to match(/Fornecedor criado com sucesso./)
      end

      it 'should not create new supplier with invalid params' do
        post '/suppliers', params: { supplier: { corporate_name: nil } } # um exemplo simples
        expect(response.status).to eq(422)
      end
    end
  end
end
