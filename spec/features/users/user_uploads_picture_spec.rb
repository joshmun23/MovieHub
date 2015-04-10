require 'rails_helper'

feature 'user uploads picture', %{
  As a user
  I want to upload a photo
  So that I can have an avatar
} do

  # Acceptance Criteria:
  # * I will have the option to upload a photo for my avatar.
  # * If I don't upload a photo I can still create an account.
  # * I can edit my profile picture.

  scenario 'adds a profile picture' do
    user = FactoryGirl.build(:user)

    visit new_user_registration_path

    fill_in 'User name', with: user.user_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    attach_file("user_profile_photo", "#{Rails.root}/app/assets/images/reel.jpeg")
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    expect(find('#profile-icon')['src']).to have_content "reel.jpeg"
  end
end
