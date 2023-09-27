# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        render plain: "I'm in the index action!"
    end
end