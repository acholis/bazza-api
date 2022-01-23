class Api::V1::RidesController < ApplicationController
    before_action :set_ride, only: [:show, :update, :destroy]
    before_action :get_ride, only: [:start, :summary]

    # GET /rides
    def index
        rides = Ride.all
        render json: rides, status: :ok
    end

    # GET /rides/1
    def show
        render json: @ride
    end

    # POST /rides
    def create
        @ride = Ride.new(ride_params)

        if @ride.save
            render json: @ride, status: :created
        else
            render json: @ride.errors.full_messages, status: :unprocessable_entity
        end
    end

    def start

    end

    def summary

    end

    


    # PATCH/PUT /rides/1
    def update
        if @ride.update(ride_params)
            render json: @ride
        else
            render json: @ride.errors, status: :unprocessable_entity
        end
    end

    # DELETE /rides/1
    def destroy
        @ride.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_ride
            @ride = Ride.find(params[:id])
        end

        def get_ride
            @ride = Ride.find(params[:ride_id])
        end

        # Only allow a list of trusted parameters through.
        def ride_params
            params.require(:ride).permit(
                :customer_id, 
                :pick_up_time, 
                :pick_up_from, 
                :drop_to,
                :status,
                :amount,
                :finished,
                :started

            )
        end
end