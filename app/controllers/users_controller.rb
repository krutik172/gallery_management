class UsersController < ApplicationController
    def show
        @user= User.find(params[:id])
        @users=User.all
        @gallery = Gallery.all
        # @gallery=@user.galleries
    end
end
