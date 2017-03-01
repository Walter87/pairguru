class MovieDecorator < Draper::Decorator
  delegate_all

  decorates_association :genre

  def as_json(*args)
    {
      id: id,
      title: title,
      genre: genre.as_json
    }
  end

  def cover
    'http://lorempixel.com/100/150/' + %W(abstract nightlife transport).sample + '?a=' + SecureRandom.uuid
  end
end

