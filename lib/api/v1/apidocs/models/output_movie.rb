module Api
  module V1
    module Apidocs
      module Models
        class OutputMovie
          include Swagger::Blocks

          swagger_schema :OutputMovie do
            key :required, [:id]

            property :id do
              key :type, :integer
            end

            property :title do
              key :type, :string
            end

            property :genre do
              key '$ref', :OutputGenre
            end
          end
        end
      end
    end
  end
end
