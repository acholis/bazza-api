class User < ApplicationRecord
    acts_as_token_authenticatable

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    has_one :customer

    after_create :create_customer

    def email_required?
        false
    end

    def create_customer
        Customer.create(
            user_id: self.id
        )
    end

end
