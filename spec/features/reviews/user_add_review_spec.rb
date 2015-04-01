require 'rails_helper'

feature 'user add review', %{
  As a authenticated user
  I want to add a review
  So that others can see it
} do
  scenario 'add a review to a movie' do
    movie = FactoryGirl.create(:movie)
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'User name', with: user.user_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit movie_path(movie)

    fill_in 'review_body', with: 'This movie is awesome!'

    click_button 'Create Review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('This movie is awesome!')
  end

  scenario 'add an empty review' do
    movie = FactoryGirl.create(:movie)

    visit movie_path(movie)

    fill_in 'review_body', with: ""

    click_button 'Create Review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('Body can\'t be blank')
  end
end
