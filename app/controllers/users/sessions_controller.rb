# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: [:create]


    # POST /resource/sign_in
    def create
        user = User.find_by_cell_phone(sign_in_params[:cell_phone])

        if user && user.valid_password?(sign_in_params[:password])
            data = {
                token: user.authentication_token,
                role: user.role
            }

            data.merge!(customer: user.customer) if user.customer?
            data.merge!(driver: user.driver) if user.driver?

            render json: {
                message: "Sessão iniciada com suesso",
                success: true,
                data: data
            }, status: :ok
        else
            render json: {
                message: "Nº de telefone ou senha invalido",
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
