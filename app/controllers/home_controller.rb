class HomeController < ApplicationController

    def index
        #msg = "BAZZA TAXI\nPara validar a sua conta por favor introduzir este código\n\n#{1234}"
        #SendSms.new( msg, "937731992").call


        payment = Express.new('913747220', '129.45').call

        render json: {
            data: "MOTO TAXI API",
            response: payment
        }
    end

end
