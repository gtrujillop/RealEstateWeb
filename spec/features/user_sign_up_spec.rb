require 'rails_helper'

describe "the signin process", :type => :feature do
  let(:params) { { user_name: 'some_user', first_name: 'Some', lastname: 'User', identity: 'Some',
               birth_date: '09-11-1988', email: 'some_email@mail.com', phone: '6665773',
               password: '12345', password_confirmation: '12345' } }

  scenario 'Shows the registration page' do
    visit root_path
    expect(page).to have_content('Regístrese')

    click_link('Regístrese !')
    expect(page).to have_content('Formulario de Registro')

  end

  scenario 'Saves a registered user as lease_holder' do
    visit new_user_path
    expect(page).to have_content('Formulario de Registro')
    fill_in 'user_username', with: 'new_user'
    fill_in 'user_first_name', with: 'New'
    fill_in 'user_last_name', with: 'User'
    fill_in 'user_identity', with: '1047401321'
    fill_in 'user_birth_date', with: '09/11/1988'
    fill_in 'user_email', with: 'newuser@mail.com'
    fill_in 'user_password', with: 'blahpassword'
    fill_in 'user_password_confirmation', with: 'blahpassword'
    select('Vender/Arrendar', from: 'user_type')
    click_button('Crear mi cuenta')
    expect(LeaseHolder.all.count).to eq(1)
    expect(LeaseHolder.first.username).to eq('new_user') 
  end

  scenario 'Saves a registered user as User' do
    visit new_user_path
    expect(page).to have_content('Formulario de Registro')
    fill_in 'user_username', with: 'new_user'
    fill_in 'user_first_name', with: 'New'
    fill_in 'user_last_name', with: 'User'
    fill_in 'user_identity', with: '1047401321'
    fill_in 'user_birth_date', with: '09/11/1988'
    fill_in 'user_email', with: 'newuser@mail.com'
    fill_in 'user_password', with: 'blahpassword'
    fill_in 'user_password_confirmation', with: 'blahpassword'
    select('Comprar/Alquilar', :from => 'user_type')
    click_button('Crear mi cuenta')
    expect(User.all.count).to eq(1)
    expect(User.first.username).to eq('new_user') 
    expect(User.first.type).to eq('')
  end

  scenario 'Login as a registered user' do
    params = { username: "user_1", first_name: "Juan", 
                        last_name: "Perez", birth_date: '11-09-1988', 
                        email:'my_email@email.com', 
                        password: 'password_1', 
                        password_confirmation: 'password_1'}
    User.create(params)    
    visit root_path
    expect(page).to have_content('iniciar sesión')
    click_link('iniciar sesión')
    expect(page).to have_content('Login')
    fill_in 'Email', with: params[:email]
    fill_in 'Password', with: params[:password]
    click_button 'Login'
    expect(page).to have_content('my_email@email.com')
    expect(page).to have_content('user_1')

  end

  scenario 'Login as a un-registered user' do
    params = { username: "user_1", first_name: "Juan", 
                        last_name: "Perez", birth_date: '11-09-1988', 
                        email:'my_email@email.com', 
                        password: 'password_1', 
                        password_confirmation: 'password_1'}
    visit root_path
    expect(page).to have_content('iniciar sesión')
    click_link('iniciar sesión')
    expect(page).to have_content('Login')
    fill_in 'Email', with: params[:email]
    fill_in 'Password', with: params[:password]
    click_button 'Login'
    expect(page).to have_content('Email o password erróneos.')

  end
end