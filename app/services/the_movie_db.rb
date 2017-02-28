require 'httparty'

class TheMovieDb
  attr_reader :options

  include HTTParty
  base_uri "api.themoviedb.org/3/"
  default_params :api_key => ENV['THE_MOVIEDB_V3']

  def initialize movie
    @options = { query: { query: movie.title, year: movie.released_at } }
  end

  def movie_details
    movie_from_api ||= movie_search.parsed_response['results'].first

    return nil if movie_from_api.nil?

    OpenStruct.new(movie_from_api)
  end

  private

  def movie_search
    @movie_search ||= self.class.get("/search/movie", @options )
  end
end
