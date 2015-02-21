module Features
  module SessionHelpers
    def sign_up_with(params)
      visit sign_up_path
      fill_in 'Username', with: email
      fill_in 'Firstname', with: email
      fill_in 'Lastname', with: email
      fill_in 'Email', with: email
      fill_in 'Phone', with: email
      fill_in 'Password', with: password
      fill_in 'Password Confirmation', with: password
      fill_in 'Birth Date', with: password

      click_button 'Sign up'
    end

    def sign_in
      user = create(:user)
      visit sign_in_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end