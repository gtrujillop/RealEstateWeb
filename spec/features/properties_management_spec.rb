require 'rails_helper'

describe "the properties management", :type => :feature do
  let!(:user) { create(:lease_holder) }
  let!(:property) { create(:property, lease_holder: user) }

  before do
    login_me(user)
  end

  #TODO Fix the JS validations

  scenario 'Shows the index properties for the leaseholder' do
    visit user_properties_path(user.id)
    expect(page).to have_content('Propiedades Registradas')
  end

  scenario 'Shows the properties menu for the leaseholder' do
    visit new_user_property_path(user.id)
    expect(page).to have_content('Registrar Propiedad')
  end

  scenario 'shows the property registration form' do
    countries = double(CountriesWithCitiesGrouper)
    allow(CountriesWithCitiesGrouper).to receive(:new).with('Americas') { countries }
    allow(countries).to receive(:cities_for).with('Colombia') { ['Cartagena de Indias'] }
    visit new_user_property_path(user.id)
    select 'Cartagena de Indias', from: "property_city"
    fill_in 'property_neighbor', with: 'Torices'
    fill_in 'property_location', with: 'Calle 42 # 14B-2 a 14B-100'
    fill_in 'property_area', with: '100'
    fill_in 'property_floors_number', with: 1
    fill_in 'property_floor', with: 1
    fill_in 'property_building_name', with: ''
    click_button('Registrar')
    expect(Property.last).to_not be_nil
  end

  scenario 'shows the edit property form' do
    countries = double(CountriesWithCitiesGrouper)
    allow(CountriesWithCitiesGrouper).to receive(:new).with('Americas') { countries }
    allow(countries).to receive(:cities_for).with('Colombia') { ['Cartagena de Indias'] }
    visit edit_user_property_path(user.id, property.id)
    fill_in 'property_area', with: '100'
    select 'Vender', from: "property_for_sell"
    click_button('Guardar')
    expect(Property.last.area).to eq(100)
  end
end
