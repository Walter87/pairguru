class GenreDecorator < Draper::Decorator
  delegate_all
  decorates_association :movies

  def as_json(*args)
    {
      id: id,
      name: name,
      number_of_movies: number_of_movies
    }
  end

  def number_of_movies
    object.movies.count
  end
end
