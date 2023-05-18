class AddRoomType < ActiveRecord::Migration[6.1]
  def up
    remove_column :chats, :receiver_type, :receiver_type, null: false
    execute <<-SQL
      DROP TYPE receiver_type;
      CREATE TYPE room_type AS ENUM ('personal', 'channel');
    SQL
    add_column :rooms, :room_type, :room_type, null: false
  end

  def down
    remove_column :rooms, :room_type, :room_type, null: false
    execute <<-SQL
      CREATE TYPE receiver_type AS ENUM ('person', 'channel');
      DROP TYPE room_type;
    SQL
    add_column :chats, :receiver_type, :receiver_type, null: false
  end
end
