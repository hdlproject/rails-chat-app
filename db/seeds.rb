# frozen_string_literal: true
require "securerandom"

User.destroy_all

user1 = User.create(name: "user 1", is_online: false)
user2 = User.create(name: "user 2", is_online: false)
