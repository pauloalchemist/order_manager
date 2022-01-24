# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  let(:user) { build(:user) }
  let(:customer) { build(:customer) }
  let(:customer_address) { build(:customer_address) }
  let(:state) { create(:state) }
  let(:city) { create(:city) }

  describe 'POST customers#create' do
    context 'when the user is logged in' do
      before do
        sign_in(user)
      end

      it 'should render template new' do
        get '/customers/new'
        expect(response).to render_template(:new)
      end

      it 'should create new customer' do
        post '/customers',
             params:
              { customer:
                { name: customer.name,
                  cnpj: customer.cnpj,
                  email: customer.email,
                  customer_addresses_attributes:
                    { "0":
                      { address: customer_address.address,
                        number: customer_address.number,
                        district: customer_address.district,
                        cities_id: city[:id],
                        states_id: state[:id],
                        zipcode: customer_address.zipcode } } } }

        expect(response).to redirect_to(assigns(:customer))
        expect(flash[:notice]).to match(/Cliente criado com sucesso./)
      end
    end
  end
end
