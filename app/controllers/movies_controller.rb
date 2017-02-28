class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info]

  expose_decorated(:movies) { Movie.all }
  expose(:movie)
  expose(:movie_info)

  def send_info
    MovieInfoMailer.send_info(current_user, movie).deliver_now
    redirect_to :back, notice: 'Email sent with movie info'
  end

  def export
    file_path = 'tmp/movies.csv'
    MovieExporter.new.call(current_user, file_path)
    redirect_to root_path, notice: 'Movies exported'
  end

  private

  def movie_info
    @movie_info ||= the_movie_db_api.movie_details
  end

  def the_movie_db_api
    @the_movie_db_api ||= TheMovieDb.new movie
  end
end
