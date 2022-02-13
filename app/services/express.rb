class Express
    require 'vpos'

    attr_reader :cell_phone, :amount

    def initialize(cell_phone, amount)
        @cell_phone = cell_phone
        @amount = amount
    end

    def call
        merchant = Vpos.new(token: express_token)
        payment = merchant.new_payment(@cell_phone, @amount)
        return payment
    end

    private

        def express_token
            'eo4f6j84ihcvm0tr56t5dkpdl61t0mg3' #ENV['EXPRESS_TOKEN']
        end

end