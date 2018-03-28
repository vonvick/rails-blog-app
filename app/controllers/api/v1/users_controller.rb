require 'json_web_token'

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_request!, except: [:create, :login]
      before_action :find_user, only: [:show, :update, :destroy]
      before_action :is_admin?, only: [:index]
      
      def index
        @users = User.all
        return json_response({ users: [] }, :not_found) unless @users
        json_response({ users: @users }, :ok)
      end

      def show
        @user = User.find_by_id(params[:id])
        return json_response({ users: [] }, :not_found) unless @user
        json_response({ users: @user }, :ok)
      end

      def create
        role = Role.find_by(title: 'regular')

        if user_params
          user = User.new(user_params)
          user.role = role
          
          user.save!
          auth_token = JsonWebToken.encode({
            user_id: user.id,
            email: user.email,
            username: user.username,
            role_id: user.role_id
          })
          json_response({ data: { auth_token: auth_token, user: user } }, :created)
        else
          json_response({ error: 'Password does not match' }, :bad_request)
        end
      end

      def update
        return json_response({ users: [] }, :not_found) unless @user
        @user.update!(user_params)
        json_response({ user: find_user }, :ok)
      end

      def destroy
        return json_response({ users: [] }, :not_found) unless @user
        @user.update!({ is_active: false })
        json_response({ user: find_user }, :ok)
      end

      def login
        user = User.find_by(email: params[:email].to_s.downcase)

        if user && user.authenticate(params[:password])
          auth_token = JsonWebToken.encode({
            user_id: user.id,
            email: user.email,
            username: user.username,
            role_id: user.role_id
          })
          json_response({ auth_token: auth_token }, :ok)
        else
          json_response({ error: 'Invalid email/password' }, :unauthorised)
        end
      end

      private
      
      def user_params
        params.permit(
          :firstname,
          :lastname,
          :email,
          :username,
          :password,
          :password_confirmation
        )
      end

      def find_params
        params.permit(:id)
      end

      def find_user
        @user = User.find_by(id: find_params[:id])
      end
    end
  end
end
