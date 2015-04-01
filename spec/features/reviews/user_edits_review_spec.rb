require 'rails_helper'

feature 'user edits review', %{
  As a authenticated user
  I want to be able to edit a review
  So I can correct errors
} do
  scenario 'edit a review' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review, movie: movie)

    visit movie_path(movie)

    first('.edit').click_link 'Edit'

    first('.review-form').fill_in 'review_body', with: 'This movie my new review'
    first('.actions').click_button 'Update Review'


    expect(page).to have_content(movie.title)
    expect(page).to have_content('This movie my new review')
  end

  scenario 'edit a review with empty body' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review, movie: movie)

    visit movie_path(movie)

    first('.edit').click_link 'Edit'

    first('.review-form').fill_in 'review_body', with: ''
    first('.actions').click_button 'Update Review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('Body can\'t be blank')
  end
end
