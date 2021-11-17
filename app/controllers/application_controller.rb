class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
     include Pundit
     rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
          end

        
  
          def authenticate_admin_user!
               unless current_user.admin == true 
                    redirect_to galleries_path
               end
          end

          def user_not_authorized
               flash[:danger]="Access Deny"
               redirect_to galleries_path
          end
end
