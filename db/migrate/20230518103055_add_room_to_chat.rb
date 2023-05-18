class AddRoomToChat < ActiveRecord::Migration[6.1]
  def change
    add_reference :chats, :room, foreign_key: { to_table: :rooms }, null: false
  end
end
