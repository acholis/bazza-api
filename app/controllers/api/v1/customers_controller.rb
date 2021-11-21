class Api::V1::CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :update, :destroy]

    # GET /api/v1/customers
    #def index
    #    @api_v1_customers = Api::V1::Customer.all

    #    render json: @api_v1_customers
    #end

    ## GET /api/v1/customers/1
    #def show
    #    render json: @api_v1_customer
    #end

    ## POST /api/v1/customers
    #def create
    #    @api_v1_customer = Api::V1::Customer.new(api_v1_customer_params)

    #    if @api_v1_customer.save
    #    render json: @api_v1_customer, status: :created, location: @api_v1_customer
    #    else
    #    render json: @api_v1_customer.errors, status: :unprocessable_entity
    #    end
    #end

    # PATCH/PUT /api/v1/customers/1
    def update
        if @customer.update(customer_params)
            render json: @customer
        else
            render json: @customer.errors, status: :unprocessable_entity
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
