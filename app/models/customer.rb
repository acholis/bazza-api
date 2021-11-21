class Customer < ApplicationRecord
  extend FriendlyId
  friendly_id :first_name, use: :slugged

  belongs_to :user
end
