class LikesController < ApplicationController
    before_action :find_gallery
    before_action :find_like, only: [:destroy]
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @gallery.likes.create(user_id: current_user.id)
    end
    redirect_to gallery_path(@gallery)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to gallery_path(@gallery)
  end

  private
  def find_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def find_like
    @like = @gallery.likes.find(params[:id])
   end
 

  def already_liked?
    Like.where(user_id: current_user.id, gallery_id:
    params[:gallery_id]).exists?
  end
end
