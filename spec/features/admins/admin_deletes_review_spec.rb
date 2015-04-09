require 'rails_helper'

feature 'admin deletes reviews', %{
  As an admin
  I want to edit reviews
  So that I can delete them for being bad
} do
  let(:admin) { FactoryGirl.create(:user, admin: true) }

  before :each do
    sign_in_as admin
  end

  scenario 'delete individual reviews' do
    review = FactoryGirl.create(:review)
    visit movie_path(review.movie)
    first('.delete-review').click_link 'Delete icon'

    expect(page).to have_content('Review deleted')
    expect(page).to have_content(review.movie.title)
    expect(page).to_not have_content(review.body)
  end
end
