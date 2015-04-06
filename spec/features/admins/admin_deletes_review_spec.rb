require 'rails_helper'

feature 'admin deletes reviews', %{
  As an admin
  I want to edit reviews
  So that I can delete them for being bad
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'delete individual reviews' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review, movie: movie, user: user)
    # binding.pry
    click_link 'Sign Out'

    user = create_admin(:user)
    sign_in_as user

    visit movie_path(movie)

    first('.delete').click_link 'Delete'

    expect(page).to have_content('Review deleted')
    expect(page).to have_content(movie.title)
    expect(page).to_not have_content(review.body)
  end
end
