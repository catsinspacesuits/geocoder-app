require 'spec_helper'
require 'rails_helper'

feature 'find coordinates' do
  scenario 'with valid place name' do
  	user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
  	sign_in user
    geocode('London')
    expect(page).to have_content('51.5073219, -0.1276474')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password', 'password'
    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', '', ''
    expect(page).to have_content('Password can\'t be blank')
  end

  def geocode(q)
    visit locations_path
    fill_in 'text_field_tag', with: q
    click_button 'geocode'
  end

end
