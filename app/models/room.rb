class Room < ApplicationRecord
  has_and_belongs_to_many :members, class_name: 'User', foreign_key: :room_id, association_foreign_key: :member_id

  PERSONAL = 'personal'.freeze
  CHANNEL = 'channel'.freeze

  enum room_type: { personal: PERSONAL, channel: CHANNEL }, _prefix: true
end
