class Chat < ApplicationRecord
  belongs_to :user, foreign_key: :sender_id
  belongs_to :room
end
