# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do
  describe 'GET suppliers#index' do
    # before { get :index }
    context 'when the user is logged in' do
      it 'should response with status 200' do
        get :index
        should respond_with(200)
      end
    end
  end
end
