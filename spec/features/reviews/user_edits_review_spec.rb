require 'rails_helper'

feature 'user edits review', %{
  As a authenticated user
  I want to be able to edit a review
  So I can correct errors
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'edit a review' do
    movie = FactoryGirl.create(:movie)
    FactoryGirl.create(:review, movie: movie, user: user)

    visit movie_path(movie)

    first('.edit').click_link 'Edit'

    first('.review-form').fill_in 'review_body', with: 'This movie my new review'
    first('.actions').click_button 'Update Review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('This movie my new review')
  end

  scenario 'edit a review with empty body' do
    movie = FactoryGirl.create(:movie)
    FactoryGirl.create(:review, movie: movie, user: user)

    visit movie_path(movie)

    first('.edit').click_link 'Edit'

    first('.review-form').fill_in 'review_body', with: ''
    first('.actions').click_button 'Update Review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('Body can\'t be blank')
  end
end
