class EventRegistration < ApplicationRecord
  belongs_to :event
  has_many :custom_data, as: :customizable
end
