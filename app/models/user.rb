class User < ApplicationRecord
  def self.create_user_and_access(username, password, name)
    self.transaction do
      @user = User.create!(name: name)
      @user_access = UserAccess.create!(user_id: @user.id, username: username, password: password)
    end

    @user
    @user_access
  end
end
