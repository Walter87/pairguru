require 'rails_helper'

describe Api::V1::MoviesController do
  describe '#index' do
    before { get :index, format: :json }

    it { should render_template :index }

    it { should respond_with(:ok) }
  end

  describe '#show' do
    before { get :show, id: 1, format: :json }

    it { should render_template :show }

    it { should respond_with(:ok) }
  end
end
