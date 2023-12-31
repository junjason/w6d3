# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        if params[:query]
            users = User.where("users.username LIKE ?", "#{params[:query]}%")
        else
            users = User.all
        end
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update 
        user = User.find(params[:id])

        if user.update(user_params)
            redirect_to user_url(user)
        else
            render user.errors.full_messages, status: 422
        end

    end

    def destroy 
        user = User.find_by(id: params[:id])

        if user && user.destroy
            redirect_to users_url
        else
            render json: {'error': "User doesn't exist"}, status: 404
        end

    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end