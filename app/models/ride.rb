class Ride < ApplicationRecord
    belongs_to :customer
    belongs_to :driver, optional: true

    enum status: {
        pending: 0,
        accepted: 1,
        rejected: 2
    }


    def start

    end


    def summary

    end




end
