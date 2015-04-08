require 'rails_helper'

feature 'admin view users', %{
  As an admin
  I want to view a list of users
  So that I can delete them for being bad
} do

  scenario 'delete individual user' do
    admin = FactoryGirl.create(:user, admin: true)
    sign_in_as admin

    visit users_path

    click_button 'Delete User'

    expect(page).to_not have_content(admin.email)
  end
end
