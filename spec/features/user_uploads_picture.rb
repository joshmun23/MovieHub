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

  scenario 'adds a profile picture', focus: true do
    visit new_user_registration_path

    fill_in 'User name', with: 'john'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    attach_file("#{Rails.root}/app/assets/images/reel.jpeg")

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    save_and_open_page
    expect(page).to have_css("img", src: "/public/images/foo.png")
  end
end
