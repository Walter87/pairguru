require 'rails_helper'

describe TheMovieDb, type: :service do
  let(:movie) { stub_model Movie, title: 'Lorem', released_at: '2010-01-01' }
  let(:options) { { query: { query: movie.title, year: movie.released_at } } }

  subject { TheMovieDb.new movie }

  it { should be_a HTTParty }

  its(:options) { should eq(options) }

  it do
    expect(subject.class.base_uri).to eq "http://api.themoviedb.org/3"

    expect(subject.class.default_params).to eq({ api_key: ENV['THE_MOVIEDB_V3'] })
  end

  describe '#movie_details' do
    let(:response) { double }

    before { expect(subject).to receive_message_chain(:movie_search, :parsed_response, :[], :first)
      .with(no_args).with(no_args).with('results').with(no_args) { response } }

    context 'when movie found in api database' do
      before { allow(response).to receive(:nil?).and_return false }

      before { expect(OpenStruct).to receive(:new).with(response).and_return(:movie_details) }

      its(:movie_details) { should eq :movie_details }
    end

    context' when movie not found in api database' do
      before { allow(response).to receive(:nil?).and_return true }

      its(:movie_details) { should be nil }
    end
  end

  # private_methods
  describe '#movie_search' do
    before { expect(subject.class).to receive(:get).with("/search/movie", options).and_return(:response) }

    its(:movie_search) { should eq :response }
  end
end
