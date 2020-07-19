class Profile < ApplicationRecord
  belongs_to :user
  has_many :custom_data, as: :customizable
end
