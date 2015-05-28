require 'rails_helper'

describe "the operations management", :type => :feature, :js => true do
  let(:user) { create(:lease_holder) }

  before do
    login_me(user)
  end

  scenario 'Shows new operation view to leaseholder' do
    expect(page).to have_selector('a.dropdown-toggle')
    page.find('a.dropdown-toggle').click
    page.find('li#operaciones.dropdown-submenu').hover
    click_link('Nueva Operación')
    expect(page).to have_content('Nueva Operación')
  end

end
