class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :chats, :receiver_id, :bigint, null: false

    create_table :rooms do |t|
      t.timestamps
    end

    create_table :rooms_users, id: false do |t|
      t.belongs_to :room, null: false, foreign_key: true
      t.belongs_to :member, null: false, foreign_key: {to_table: :users}
    end
  end
end
