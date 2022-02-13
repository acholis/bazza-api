class User < ApplicationRecord
    acts_as_token_authenticatable

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    has_one :customer
    has_one :driver

    after_create :create_customer

    enum role: {
        customer: 0,
        driver: 1,
        admin: 222
    }

    def send_code_validation
        code = generate_code

        msg = "BAZZA TAXI\n Para validar a sua conta por favor introduzir este código\n\n#{code}"
        SendSms.new( msg, self.cell_phone).call

        ValidationCode.create(
            code: code,
            cell_phone: self.cell_phone,
            user_id: self.id
        )
    end

    def email_required?
        false
    end

    def create_customer
        Customer.create(
            user_id: self.id
        )
    end

    def generate_code
        loop do
            code = srand.to_s.last(4) # rand.to_s[2..5].to_i
            break code unless ValidationCode.where(code: code).exists?
        end
    end

end
