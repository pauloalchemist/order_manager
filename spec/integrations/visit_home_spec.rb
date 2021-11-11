require 'rails_helper'

describe 'visit home' do
  before :each do
    visit '/'
  end

  it 'and find main message' do
    expect(page).to have_content('Página Principal')
  end
  it 'and find navbar' do
    expect(page).to have_css('nav.navbar')
  end
end
