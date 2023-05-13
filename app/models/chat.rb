class Chat < ApplicationRecord
  PERSON = "person"
  CHANNEL = "channel"

  enum receiver_type: { person: PERSON, channel: CHANNEL }, _prefix: true
end
