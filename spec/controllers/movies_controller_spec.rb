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
    user1 = FactoryGirl.create(:user, email: 'mail@example.com')

    let(:delivery) { double }

    before do
      sign_in user1

      expect(controller).to receive(:authenticate_user!)

      expect(controller).to receive(:movie) { movie }

      request.env["HTTP_REFERER"] = "where_i_came_from"

      get :send_info, { id: movie.id }
    end

    it { should redirect_to "where_i_came_from" }
  end

  describe '#export' do
    ActiveJob::Base.queue_adapter = :test

    before { expect{ExportMoviesJob.perform_later}.to have_enqueued_job(ExportMoviesJob) }

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
