class Driver < ApplicationRecord
    belongs_to :user, optional: true

    #after_create :create_user
    #after_destroy :destroy_user, prepend: true

    validates :driving_licence, uniqueness: { message: "Nº de carteira não disponível" }, on: :create

    #def create_user
    #    user = User.create(
    #        cell_phone: self.cell_phone,
    #        role: 1,
    #        password: '123456',
    #        password_confirmation: '123456'
    #    )
    #    self.update_attribute(:user_id, user.id) if user.id.present?
    #end

    #def destroy_user
    #    self.user.destroy
    #end

end
