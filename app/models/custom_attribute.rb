class CustomAttribute < ApplicationRecord
  enum source: { user: 0, profile: 1, event_registration: 2 }
  enum data_type: { boolean: 0, text: 1 }
end
