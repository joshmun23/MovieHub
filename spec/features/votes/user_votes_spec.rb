require 'rails_helper'

feature 'user votes on a review', %{
  As a authenticated user
  I want to vote a review
  So I can help others
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'deletes a review', js: true, focus: true do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review, movie: movie, user: user)

    visit movie_path(movie)
    first('vote-up').click_link 'Up vote'

    expect(page).to have_content('1')
    expect(page).to have_content(movie.title)
    expect(page).to_not have_content(review.body)
  end
end
