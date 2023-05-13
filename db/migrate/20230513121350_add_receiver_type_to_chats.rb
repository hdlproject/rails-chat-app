class AddReceiverTypeToChats < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE receiver_type AS ENUM ('person', 'channel');
    SQL
    add_column :chats, :receiver_type, :receiver_type, null: false
  end

  def down
    remove_column :chats, :receiver_type
    execute <<-SQL
      DROP TYPE receiver_type;
    SQL
  end
end
