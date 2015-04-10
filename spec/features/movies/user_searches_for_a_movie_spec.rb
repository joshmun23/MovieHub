feature 'user searches for a movie', %{
  As a user,
  I want to search for a movie keyword
  So that I can see all movies matching that keyword
} do

  scenario 'user inputs a valid search term' do
    movie = FactoryGirl.create(:movie, title: "Ocean")

    visit movies_path

    fill_in "search_title", with: "Ocean"
    click_on "Search"

    expect(page).to have_content(movie.title)
  end

  scenario 'no search results found for user search' do
    movie = FactoryGirl.create(:movie)

    visit movies_path

    fill_in "search_title", with: "Wonka"
    click_on "Search"

    expect(page).to have_content("No movie matches found")
  end

  scenario 'user inputs a blank search term' do
    movies = FactoryGirl.create(:movie)

    visit movies_path

    fill_in "search_title", with: ""
    click_on "Search"

    expect(page).to have_content("No movie matches found")
  end
end
