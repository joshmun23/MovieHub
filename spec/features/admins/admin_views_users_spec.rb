require 'rails_helper'

feature 'admin view users', %{
  As an admin
  I want to view a list of users
  So that I can delete them for being bad
} do

  scenario 'view list of users' do
    user = create_admin(:user)
    sign_in_as user

    visit users_path

    expect(page).to have_content(user.email)
  end
end
