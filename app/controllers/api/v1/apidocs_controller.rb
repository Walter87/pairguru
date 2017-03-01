class Api::V1::ApidocsController < ApplicationController
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Api Pairguru'
      contact do
        key :name, 'Walter'
      end
    end
    key :host, (ENV['SWAGGER_BLOCKS_HOST'] || 'localhost:3000')
    key :basePath, '/api/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    self,
    Api::V1::Apidocs::Models::OutputMovie,
    Api::V1::Apidocs::Models::OutputMovies,
    Api::V1::Apidocs::Models::OutputGenre,
    Api::V1::Apidocs::Movies,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
