require 'rails_helper'

feature 'user sees all reviews for a movie', %Q{
  As a authenticated user
  I want to see the revies of a movie if there is any
  So I can read the reviews
} do
  scenario 'user visit movie detail page' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)

    visit movie_path(movie)

    expect(page).to have_content(movie.title)
    expect(page).to have_content(review.body)
  end
end
