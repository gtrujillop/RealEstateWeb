def login_me(user)
  page.driver.allow_url("secure.gravatar.com")
  visit root_path
  click_link('iniciar sesión')
  fill_in 'Email', with: user.email
  fill_in 'Password', with: 'password'
  click_button 'Login'
end
