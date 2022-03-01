class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_in) do |user_params|
                user_params.permit(
                    :email,
                    :cell_phone, 
                    :password
                )
            end

            devise_parameter_sanitizer.permit(:sign_up) do |user_params|
                user_params.permit(:cell_phone, :password, :password_confirmation, :role)
            end

            #devise_parameter_sanitizer.permit(:sign_up, keys: [:cell_phone])
        end

end
