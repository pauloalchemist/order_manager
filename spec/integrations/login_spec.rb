# frozen_string_literal: true

require 'rails_helper'

describe 'User sign in process', type: :feature do
  before :each do
    User.create(email: 'paulo@gmail.com', password: 'pAssword@#19', first_name: 'Paulo', last_name: 'Giovani')
  end
  it 'should sign in' do
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'paulo@gmail.com'
    fill_in 'Senha', with: 'pAssword@#19'
    click_button 'Entrar'
    expect(current_path).to eq('/dashboard')
  end
end
