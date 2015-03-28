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
end