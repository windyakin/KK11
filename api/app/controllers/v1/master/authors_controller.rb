module V1
  module Master
    class AuthorsController < ApplicationController
      def index
        authors = ::Master::Author.where(id: authors_params)
        render json: { data: ::Master::AuthorBlueprint.render_as_hash(authors) }
      end

      def authors_params
        @authors_params ||= params.require(:ids)
      end
    end
  end
end
