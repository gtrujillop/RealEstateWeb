def login_me(user)
  visit root_path
  click_link('iniciar sesión')
  fill_in 'Email', with: user.email
  fill_in 'Password', with: 'password'
  click_button 'Login'
end
