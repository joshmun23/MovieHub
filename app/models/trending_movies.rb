class TrendingMovies
  def initialize(movies)
    @movies = movies
  end

  def find_movies(limit=5)
    trends = Hash.new({})

    @movies.each do |movie|
      trends[movie.id] = movie.reviews.count
    end

    trends = trends.sort_by { |reviews| reviews.count}
    trends = trends[0..limit-1]

    trends = trends.map do |arr|
      Movie.find(arr[0])
    end

    trends
  end
end
