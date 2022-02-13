class Api::V1::RidesController < ApplicationController
    before_action :set_ride, only: [:show, :update, :destroy]
    before_action :get_ride, only: [:started, :finished]

    # GET /rides
    def index
        rides = Ride.all
        render json: rides, status: :ok
    end

    # GET /rides/1
    def show
        #ActionCable.server.broadcast("rides_channel_1", {data: @ride})
        render json: {
            message: "Detalhes da solicitação",
            success: true,
            data: @ride
        }, status: :ok
    end

    # POST /rides
    def create
        @ride = Ride.new(ride_params)

        if @ride.save
            #ActionCable.server.broadcast(
            #    "rides_channel_#{@ride.id}", 
            #    {data: @ride}
            #)

            render json: {
                message: "Socitação enviada com sucesso",
                success: true,
                data: @ride
            }, status: :created
        else
            render json: {
                message: "Falha no processo de solicitação",
                success: false,
                data: @ride.errors.full_messages
            }, status: :unprocessable_entity
        end
    end

    def started
        if @ride.update(started_ride_params)
            render json: {
                message: "Corrida iniciada.",
                success: true,
                data: @ride
            }, status: :ok
        end
    end

    def finished
        if @ride.update(finished_ride_params)
            render json: {
                message: "Corrida terminada",
                success: true,
                data: @ride
            }, status: :ok
        end
    end

    


    # PATCH/PUT /rides/1
    def update
        if @ride.update(update_ride_params)
            render json: {
                message: "Socitação Aceite, o motorista vem a caminho.",
                success: true,
                data: @ride
            }, status: :ok
        else
            render json: {
                message: "Falha no processo.",
                success: false,
                data: @ride.errors
            }, status: :unprocessable_entity

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

        def update_ride_params
            params.require(:ride).permit(
                :driver_id, 
                :status
            )
        end

        def started_ride_params
            params.require(:ride).permit(
                :started
            )
        end

        def finished_ride_params
            params.require(:ride).permit(
                :finished
            )
        end

end