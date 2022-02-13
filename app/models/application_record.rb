class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    require 'send_sms'

end
