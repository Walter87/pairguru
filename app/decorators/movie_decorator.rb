class MovieDecorator < Draper::Decorator
  delegate_all

  def as_json(*args)
    {
      id: id,
      title: title
    }
  end

  def cover
    'http://lorempixel.com/100/150/' + %W(abstract nightlife transport).sample + '?a=' + SecureRandom.uuid
  end
end

