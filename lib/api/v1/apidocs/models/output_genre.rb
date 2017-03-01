module Api
  module V1
    module Apidocs
      module Models
        class OutputGenre
          include Swagger::Blocks

          swagger_schema :OutputGenre do
            property :id do
              key :type, :integer
            end

            property :name do
              key :type, :string
            end

            property :number_of_movies do
              key :type, :integer
            end
          end
        end
      end
    end
  end
end
