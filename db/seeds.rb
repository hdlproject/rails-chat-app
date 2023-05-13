# frozen_string_literal: true
require "securerandom"

Chat.destroy_all
User.destroy_all

user1 = User.create(name: "user 1")
user2 = User.create(name: "user 2")

x = 10
while x > 0
  Chat.create(message: SecureRandom.base64, sender_id: user1.id, receiver_id: user2.id, receiver_type: Chat::PERSON)
  x = x - 1
end
