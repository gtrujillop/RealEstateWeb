require 'rails_helper'

describe "the signin process", :type => :feature do
  let(:params) { { username: 'some_user', firstname: 'Some', lastname: 'User',
               birthdate: '09-11-1988', email: 'some_email@mail.com', phone: '6665773',
               password: '12345', password_confirmation: '12345' } }

  scenario 'Shows the registration page' do
    visit root_path
    expect(page).to have_content('Regístrese')

    click_link('Regístrese !')
    expect(page).to have_content('Formulario de Registro')

  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

  def sign_up_with(params)
    visit sign_up_path
    fill_in 'Username', with: params[:username]
    fill_in 'Firstname', with: params[:firstname]
    fill_in 'Lastname', with: params[:lastname]
    fill_in 'Birth Date', with: params[:birthdate]
    fill_in 'Email', with: params[:email]
    fill_in 'Phone', with: params[:phone]
    fill_in 'Password', with: params[:password]
    fill_in 'Password Confirmation', with: params[:password_confirmation]
    
    click_button 'Sign up'
  end
end