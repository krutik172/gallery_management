class UsersController < ApplicationController


    def index
        @user=User.all
        respond_to do |format|
            format.html
            format.csv { send_data @user.to_csv, filename: "users-#{Date.today}.csv" }
        end
    end

    def show
        @user= User.find(params[:id])
        @users=User.all
        @gallery = Gallery.all

        # @gallery=@user.galleries
    end
end
