require 'rails_helper'

feature 'admin view users', %{
  As an admin
  I want to view a list of users
  So that I can delete them for being bad
} do

  scenario 'view list of users' do
    admin = FactoryGirl.create(:user, admin: true)
    sign_in_as admin

    visit users_path

    expect(page).to have_content(admin.email)
  end
end
