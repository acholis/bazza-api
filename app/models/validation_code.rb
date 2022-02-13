class ValidationCode < ApplicationRecord
    belongs_to :user

    def self.validation(account)
        code = ValidationCode
        .where(status: false)
        .where(cell_phone: account[:cell_phone])
        .where(code: account[:code])
        .first

        if code.present?
            code.update_columns(status: true)
            return true
        end

        return false
    end
end
