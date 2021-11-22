class Api::V1::DriversController < ApplicationController
    before_action :set_driver, only: [:show, :update, :destroy]

    def index
        drivers = Driver.all.includes(:user)
        render json: drivers, status: :ok
    end
    
    def create
        @driver = Driver.new(driver_params)

        if @driver.save
            render json: @driver, status: :created
        else
            render json: @driver.errors, status: :unprocessable_entity
        end
    end

    def update
        if @driver.update(edit_driver_params)
            render json: @driver
        else
            render json: @driver.errors, status: :unprocessable_entity
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
