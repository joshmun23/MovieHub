module AuthenticationHelper
  def sign_in_as(user)
    visit root_path
    click_on 'Sign In'

    fill_in 'User name', with: user.user_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end
end
