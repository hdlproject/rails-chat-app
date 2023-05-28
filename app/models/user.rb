class User < ApplicationRecord
  has_and_belongs_to_many :rooms, class_name: 'Room', foreign_key: :member_id, association_foreign_key: :room_id

  def create_user_and_access(user, user_access)
    ActiveRecord::Base.transaction do
      user = User.create!(user)

      user_access = UserAccess.new(user_access)
      user_access.user_id = user.id
      user_access.save!
    end

    [user, user_access]
  end
end
