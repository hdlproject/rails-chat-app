class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string :message, null: false
      t.integer :read_count, null: false, default: 0
      t.bigint :receiver_id, null: false

      t.timestamps
    end

    add_reference :chats, :sender, foreign_key: { to_table: :users }, null: false
  end
end
