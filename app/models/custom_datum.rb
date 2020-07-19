class CustomDatum < ApplicationRecord
  belongs_to :customizable, polymorphic: true
  belongs_to :custom_attribute
end
