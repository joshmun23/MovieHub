require 'rails_helper'

feature 'Create new Administrator', %{
  # As and Admin
  # I want to add more of me
  # So that I can sleep
} do
  scenario 'give user admin powers' do
    admin = FactoryGirl.create(:user, admin: true)
    sign_in_as admin

    visit users_path

    click_button 'Make Admin'

    expect(page).to have_content('Admin Successfully Created')
  end
end
