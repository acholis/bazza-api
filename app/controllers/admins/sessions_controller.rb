# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: [:create]

    def create
        admin = Admin.find_by_email(sign_in_params[:email])

        if admin && admin.valid_password?(sign_in_params[:password])
            data = 

            render json: {
                message: "Sessão iniciada com suesso",
                success: true,
                data: {
                    token: admin.authentication_token,
                    role: admin.role
                }
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
        params.require(:admin).permit(:email, :password)
    end
end
