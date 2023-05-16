class CreateUserAccesses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_accesses, id: false, primary_key: :user_id do |t|
      t.primary_key :user_id
      t.string :username, null: false, index: { unique: true, name: 'uk_username' }
      t.string :password_digest, null: false

      t.timestamps
    end

    add_foreign_key :user_accesses, :users, null: false, column: "user_id"
  end
end
