class RideChannel < ApplicationCable::Channel

    def subscribed
        #stop_all_streams
        stream_for 'rides_channel_1'
    end

    def unsubscribed

    end



end