class HomeController < ApplicationController

    def index
        payment = Express.new('913747220', '129.45').call

        render json: {
            data: "MOTO TAXI API",
            response: payment
        }
    end

end
