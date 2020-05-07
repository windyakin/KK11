module V1
  module User
    class ItemsController < ApplicationController
      before_action :authenticate_account!

      def index
        @items = current_account.items.includes(master: [:authors, :circles])
      end
    end
  end
end
