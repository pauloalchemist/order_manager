require 'rails_helper'

describe 'visit home' do
  before :each do
    visit '/'
  end

  it 'and find main message' do
    expect(page).to have_content('Gerenciador de Pedidos')
    expect(page).to have_content('A sua melhor forma de controlar seus pedidos.')
  end
  it 'and find navbar' do
    expect(page).to have_css('nav.navbar')
  end
  it 'and find main image' do
    expect(page).to have_css('div.img-main-page')
  end
end
