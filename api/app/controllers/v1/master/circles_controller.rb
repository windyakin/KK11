module V1
  module Master
    class CirclesController < ApplicationController
      def index
        circles = ::Master::Circle.where(id: circles_params)
        render json: { data: ::Master::CircleBlueprint.render_as_hash(circles) }
      end

      def show
        circle = ::Master::Circle.find(params[:id])
        render json: { data: ::Master::CircleBlueprint.render_as_hash(circle, view: :show) }
      end

      def circles_params
        @circles_params ||= params.require(:ids)
      end
    end
  end
end
