class Api::V1::DriversController < ApplicationController
    before_action :set_driver, only: [:show, :update, :destroy]

    def index
        drivers = Driver.all.includes(:user)
        render json: drivers, status: :ok
    end
    
    def create
        @driver = Driver.new(driver_params)

        if @driver.save
            render json: {
                message: "Motorista registado com sucesso",
                success: true,
                data: @driver
            }, status: :created
        else
            render json: {
                message: "Falha ao registar",
                success: false,
                data: @driver.errors.full_messages
            }, status: :unprocessable_entity
        end
    end

    def update
        if @driver.update(edit_driver_params)
            render json: {
                message: "Informações actualizada com sucesso",
                success: true,
                data: @driver
            }, status: :ok
        else
            render json: {
                message: "Falha ao actualizar",
                success: false,
                data: @driver.errors
            }, status: :unprocessable_entity
        end
    end

    def destroy
        if @driver.destroy
            render json: {message: 'Motorista removido com sucesso'}
        else
            render json: @driver.errors, status: :unprocessable_entity
        end
    end

    private
        def set_driver
            @driver = Driver.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def driver_params
            params.require(:driver).permit(
                :first_name, 
                :last_name, 
                :driving_licence,
                :cell_phone
            )
        end

        def edit_driver_params
            params.require(:driver).permit(
                :first_name, 
                :last_name, 
                :driving_licence
            )
        end

end
