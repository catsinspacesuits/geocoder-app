require 'spec_helper'
require 'rails_helper'

feature 'find coordinates' do
  scenario 'with valid place name' do
  	user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
  	sign_in user
    geocode('London')
    expect(page).to have_content('51.5073219, -0.1276474')
  end

  scenario 'with invalid place name' do
  	user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
  	sign_in user
    geocode('asasdasfsdfsdfsdf')
    expect(page).to have_content('We couldn\'t find a place by this name')
  end

  scenario 'with blank place name' do
  	user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
  	sign_in user
    geocode('')
    expect(page).to have_content('Please enter an address in the field')
  end

  def geocode(q)
    visit search_locations_path
    fill_in 'q', with: q
    click_button 'geocode'
  end

end
