module V1
  module Master
    class CirclesController < ApplicationController
      def index
        circles = ::Master::Circle.where(id: circles_params)
        render json: { data: ::Master::CircleBlueprint.render_as_hash(circles) }
      end

      def circles_params
        @circles_params ||= params.require(:ids)
      end
    end
  end
end
