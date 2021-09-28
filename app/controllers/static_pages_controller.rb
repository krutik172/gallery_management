class StaticPagesController < ApplicationController
    def home
        @gallery=Gallery.all
        @user=User.all
    end

    
end
