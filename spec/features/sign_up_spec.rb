require 'spec_helper'

feature 'user signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@email.com', 'password', 'password'
    expect(page).to have_content('Welcome! You have signed up successfully')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password', 'password'
    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', '', ''
    expect(page).to have_content('Password can\'t be blank')
  end

  def sign_up_with(email, password, password_confirmation)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Sign up'
  end
end