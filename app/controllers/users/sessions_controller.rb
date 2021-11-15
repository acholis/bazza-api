# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: [:create]


    # POST /resource/sign_in
    def create
        user = User.find_by_cell_phone(sign_in_params[:cell_phone])

        if user && user.valid_password?(sign_in_params[:password])
            render json: {
                messages: "Signed In Successfully",
                success: true,
                data: {user: user}
            }, status: :ok
        else
            render json: {
                messages: "Signed In Failed - Unauthorized",
                success: false,
                data: {}
            }, status: :unauthorized
        end
    end

    private
        def configure_sign_in_params
            params.require(:user).permit(:cell_phone, :password)
        end
end
