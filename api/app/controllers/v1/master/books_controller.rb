module V1
  module Master
    class BooksController < ApplicationController
      def index
        books = ::Master::Book.where(id: books_params)
        render json: { data: ::Master::BookBlueprint.render_as_hash(books) }
      end

      def books_params
        @books_params ||= params.require(:ids)
      end
    end
  end
end
