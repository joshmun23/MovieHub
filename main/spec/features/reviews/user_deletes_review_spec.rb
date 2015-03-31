require 'rails_helper'

feature 'user deletes a review', %Q{
  As a authenticated user
  I want to delete a review
  So that others can't see it
} do
  scenario 'deletes a review' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)

    visit movie_path(movie)

    click_link 'Delete'

    expect(page).to have_content(movie.title)
    expect(page).to_not have_content(review.body)
  end
end
