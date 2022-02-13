class Api::V1::CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :update, :destroy]

    # PATCH/PUT /api/v1/customers/1
    def update
        if @customer.update(customer_params)
            render json: {
                message: "Cliente actualizado com sucesso",
                success: true,
                data: @customer
            }, status: :ok
        else
            render json: {
                message: "Falha ao actualizar cliente",
                success: true,
                data: @customer.errors
            }, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/customers/1
    def destroy
        @customer.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_customer
            @customer = Customer.friendly.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def customer_params
            params.require(:customer).permit(:first_name, :last_name)
        end
end
