class UsersController < ApplicationController
puts "SENDGRID_USERNAME: #{ENV['SENDGRID_USERNAME']}"
puts "SENDGRID_API_KEY: #{ENV['SENDGRID_API_KEY']}"
    def show
        @user= User.find(params[:id])
        @users=User.all
        @gallery = Gallery.all

        # @gallery=@user.galleries
    end
end
