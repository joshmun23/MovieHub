require 'rails_helper'

feature 'admin view users', %{
  As an admin
  I want to view a list of users
  So that I can delete them for being bad
} do

  scenario 'delete individual user' do
    user = create_admin(:user)
    sign_in_as user

    visit users_path

    click_button 'Delete User'

    expect(page).to_not have_content(user.email)
  end
end
