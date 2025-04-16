class CreatePosts < ActiveRecord::Migration[8.0]
  def up
    create_table :posts do |t|
      t.text :content
      t.references :user, null: false
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
