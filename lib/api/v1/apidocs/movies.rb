class Api::V1::Apidocs::Movies
  include Swagger::Blocks

  swagger_path '/movies' do
    operation :get do
      key :description, 'Get movies'
      key :summary, 'Movies'
      key :tags, ['movies']

      response 200 do
        key :description, 'Movies response'
        schema do
          key :'$ref', :OutputMovies
        end
      end
    end
  end

  swagger_path '/movies/{id}' do
    operation :get do
      key :description, 'Get movies'
      key :summary, 'Movies'
      key :tags, ['movies']
      parameter do
        key :name, 'id'
        key :in, :path
        key :required, true
        key :type, :integer
      end

      response 200 do
        key :description, 'Movie response'
        schema do
          key :'$ref', :OutputMovies
        end
      end
      response 404 do
        key :description, 'Movie response'
      end
    end
  end
end
