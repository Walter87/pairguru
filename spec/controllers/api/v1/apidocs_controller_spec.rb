require 'rails_helper'

describe Api::V1::ApidocsController do
  it { should be_a ApplicationController }

  it { should be_a(Swagger::Blocks) }

  it { expect(:get => "api/apidocs").to route_to(:format => :json, :controller => "api/v1/apidocs", :action => "index" ) }

  describe '#index' do
    before { get :index, format: :json }

    it { should respond_with :ok }
  end
end
