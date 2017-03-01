module Api
  module V1
    module Apidocs
      module Models
        class OutputMovies
          include Swagger::Blocks

          swagger_schema :OutputMovies do
            property :movies do
              key :type, :array
              items do
                key '$ref', :OutputMovie
              end
            end
          end
        end
      end
    end
  end
end
