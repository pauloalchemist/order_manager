require 'rails_helper'

describe 'visit home' do
  it 'ache algo' do
    visit '/'
    expect(page).to have_content('Página Principal')
  end
end
