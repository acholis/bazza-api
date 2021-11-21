class Api::V1::DriversController < ApplicationController
    before_action :set_driver, only: [:show, :update, :destroy]


    private
        # Use callbacks to share common setup or constraints between actions.
        def set_customer
            @customer = Customer.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def customer_params
            params.require(:customer).permit(:first_name, :last_name)
        end



end
