module Api
  module V1
    class RolesController < ApplicationController
      before_action :set_role, only: [:show]

      # GET /roles
      def index
        @roles = Role.all
        json_response(@roles)
      end

      # GET /roles/:id
      def show
        json_response(@role)
      end

      private
      
      def todo_params
        params.permit(:id, :title)
      end

      def set_role
        @role = Role.find(params[:id])
      end
    end
  end
end
