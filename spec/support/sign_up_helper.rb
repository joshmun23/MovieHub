module AuthenticationHelper
  def sign_up_as(user)
    visit root_path
    click_on 'Sign Up'

    fill_in 'User name', with: user.user_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'
  end
end
