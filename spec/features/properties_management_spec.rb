require 'rails_helper'

describe "the properties management", :type => :feature, :js => true do

  scenario 'Shows the index properties for the leaseholder' do
    #TODO create an alternative scenario and
    #expectation to check that property attrs are rendered.
    page.driver.allow_url("secure.gravatar.com")
    user = create(:lease_holder)
    visit root_path
    click_link('iniciar sesión')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_selector('a.dropdown-toggle')
    page.find('a.dropdown-toggle').click
    page.find('li#propiedades.dropdown-submenu').hover
    click_link('Mis Propiedades')
    expect(page).to have_content('Propiedades Registradas')
  end

  scenario 'Shows the properties menu for the leaseholder' do
    page.driver.allow_url("secure.gravatar.com")
    user = create(:lease_holder)
    visit root_path
    click_link('iniciar sesión')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_selector('a.dropdown-toggle')
    page.find('a.dropdown-toggle').click
    page.find('li#propiedades.dropdown-submenu').hover
    click_link('Registrar Propiedad')
    expect(page).to have_content('Registrar Propiedad')
  end

  scenario 'shows the property registration form' do
    page.driver.allow_url("secure.gravatar.com")
    user = create(:lease_holder)
    visit root_path
    click_link('iniciar sesión')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Login'
    page.find('a.dropdown-toggle').click
    page.find('li#propiedades.dropdown-submenu').hover
    click_link('Registrar Propiedad')
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
  end
end
