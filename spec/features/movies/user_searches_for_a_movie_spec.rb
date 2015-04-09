feature 'user searches for a movie', %{
  As a user,
  I want to search for a movie keyword
  So that I can see all movies matching that keyword
} do

  scenario 'user inputs a valid search term' do
    movies = []

    10.times do
      movies << FactoryGirl.create(:movie)
    end

    visit movies_path

    fill_in "search_title", with: "Ocean"
    click_on "Search"

    movies.each { |movie| expect(page).to have_content(movie.title) }
  end

  scenario 'no search results found for user search' do
    movies = []

    10.times do
      movies << FactoryGirl.create(:movie)
    end

    visit movies_path

    fill_in "search_title", with: "Wonka"
    click_on "Search"

    expect(page).to have_content("No movie matches found")
  end

  scenario 'user inputs a blank search term' do
    movies = []

    10.times do
      movies << FactoryGirl.create(:movie)
    end

    visit movies_path

    fill_in "search_title", with: ""
    click_on "Search"

    expect(page).to have_content("Please enter a search term")
  end
end
