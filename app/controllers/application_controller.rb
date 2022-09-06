class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :userable_type, :userable_id])
    end
    
    def after_sign_in_path_for(resource)
        if current_user
            home_index_path
       else
           render root_path
       end
    end
end
