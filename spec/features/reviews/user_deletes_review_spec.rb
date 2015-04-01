require 'rails_helper'

feature 'user deletes a review', %{
  As a authenticated user
  I want to delete a review
  So that others can't see it
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'deletes a review' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review, movie: movie, user: user)

    visit movie_path(movie)

    first('.delete').click_link 'Delete'

    expect(page).to have_content('Review deleted')
    expect(page).to have_content(movie.title)
    expect(page).to_not have_content(review.body)
  end
end
