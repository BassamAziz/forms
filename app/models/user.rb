class User < ApplicationRecord
  has_many :custom_data, as: :customizable
end
