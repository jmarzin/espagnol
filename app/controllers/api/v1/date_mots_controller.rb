module Api
  module V1
    class DateMotsController < ApplicationController
      def index
        date = Mot.maximum("updated_at")
        render json: date.to_s
      end
    end
  end
end