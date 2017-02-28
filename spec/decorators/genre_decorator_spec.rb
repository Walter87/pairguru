require 'rails_helper'

describe GenreDecorator, type: :decorator do
  genre = FactoryGirl.build(:genre)

  subject { genre.decorate}

  describe '#number_of_movies' do
    before { expect(genre).to receive_message_chain(:movies, :count) { :number_of_movies } }

    its(:number_of_movies) { should eq :number_of_movies }
  end
end
