class GalleryPolicy < ApplicationPolicy
   
        attr_reader :user, :gallery
   
      def initialize user, gallery
        @user = user
        @gallery = gallery
      end
    
      def update?
        @gallery.user == @user
      end

      def destroy?
        @gallery.user == @user
      end
   
    
end