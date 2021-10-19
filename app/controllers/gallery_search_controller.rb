class GallerySearchController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new_search
      
    end


    def search_galleries
    
        @search =  Gallery.search do 
            fulltext search_params[:title] 
        end
        
        @gallery = @search.results
    end


    private
    def search_params
        params.permit(:title, :image,:user_id,:name)
    end

end
