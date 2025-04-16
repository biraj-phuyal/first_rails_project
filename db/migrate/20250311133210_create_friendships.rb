class CreateFriendships < ActiveRecord::Migration[8.0]
  def up
    create_table :friendships do |t|
      t.references :user1, null: false, foreign_key: { to_table: :users }
      t.references :user2, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end

  def down
    drop_table :friendships
  end
end
