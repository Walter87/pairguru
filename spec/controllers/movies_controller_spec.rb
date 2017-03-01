require 'rails_helper'

describe MoviesController, type: :controller do
  user = FactoryGirl.build(:user)

  movie = FactoryGirl.create(:movie)

  describe '#index' do
    before { get :index }

    it { should render_template :index }
  end

  describe '#show' do
    before { get :show, { id: 1 } }

    it { should render_template :show }
  end

  describe '#send_info' do
    before { sign_in user }

    let(:delivery) { double }

    before { expect(controller).to receive(:authenticate_user!) }

    before { expect(controller).to receive(:current_user) { user } }

    before { expect(Movie).to receive(:find).with(movie.id.to_s) { movie } }

    before { expect_any_instance_of(MovieInfoMailer).to receive(:sleep) }

    before { request.env["HTTP_REFERER"] = "where_i_came_from" }

    before { get :send_info, { id: movie.id } }

    it { should redirect_to "where_i_came_from" }
  end

  describe '#export' do
    before { expect(MovieExporter).to receive_message_chain(:new, :call).with(no_args).with(nil, 'tmp/movies.csv') }

    before { get :export }

    it { should redirect_to root_path }
  end

  #private messages
  describe '#movie_info' do
    before { expect(controller).to receive_message_chain(:the_movie_db_api, :movie_details) { :movie_info } }

    its(:movie_info) { should eq(:movie_info) }
  end

  describe '#the_movie_db_api' do
    before { expect(TheMovieDb).to receive(:new) { :the_movie_db_api } }

    its(:the_movie_db_api) { should eq :the_movie_db_api }
  end
end
