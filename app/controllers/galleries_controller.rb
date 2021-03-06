class GalleriesController < ApplicationController
    before_action :authenticate_user!
    def index
        if params[:query].present?
            @gallery = Gallery.search(params[:query]).includes(:user)
        else
            @gallery = Gallery.includes(:user)
        end
       
    end

    def show
        @gallery = Gallery.find(params[:id])
        @user=@gallery.user
    end

    def new
        @gallery = Gallery.new
    end

    def create
        @gallery = current_user.galleries.build(gallery_params)

        if @gallery.save
            redirect_to @gallery
        else
            render :new
        end
    end

    def edit
        @gallery = Gallery.find(params[:id])
    end
    
    def update
        
        
        @gallery = Gallery.find(params[:id])
        authorize @gallery
        if @gallery.update(gallery_params)
            redirect_to @gallery
        else
            render :edit
        end

    end

    def destroy
        @gallery = Gallery.find(params[:id])
        authorize @gallery
        @gallery.destroy
        redirect_to root_path
    end

  
    private

    def gallery_params
        params.require(:gallery).permit(:title,:image)
    end
end
