require 'rails_helper'

describe "the properties management", :type => :feature, :js => true do
  let(:user) { create(:lease_holder) }

  before do
    login_me(user)
  end

  scenario 'Shows the index properties for the leaseholder' do
    expect(page).to have_selector('a.dropdown-toggle')
    page.find('a.dropdown-toggle').click
    page.find('li#propiedades.dropdown-submenu').hover
    click_link('Mis Propiedades')
    expect(page).to have_content('Propiedades Registradas')
  end

  scenario 'Shows the properties menu for the leaseholder' do
    expect(page).to have_selector('a.dropdown-toggle')
    page.find('a.dropdown-toggle').click
    page.find('li#propiedades.dropdown-submenu').hover
    click_link('Registrar Propiedad')
    expect(page).to have_content('Registrar Propiedad')
  end

  scenario 'shows the property registration form' do
    visit new_user_property_path(user.id)
    page.select 'Cartagena', :from => 'property_city'
    fill_in 'property_neighbor', with: 'Torices'
    fill_in 'property_location', with: 'Calle 42 # 14B-2 a 14B-100'
    fill_in 'property_area', with: '100'
    fill_in 'property_floors_number', with: 1
    fill_in 'property_floor', with: 1
    fill_in 'property_building_name', with: ''
    click_button('Registrar')
    expect(Property.last).to_not be_nil
  end
end
