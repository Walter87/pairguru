class Api::V1::MoviesController < Api::V1::BaseController
  expose_decorated(:movies) { Movie.all }
  expose(:movie)

  respond_to :json
end
