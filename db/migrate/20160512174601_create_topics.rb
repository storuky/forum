class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      
      t.integer :user_id
      t.index :user_id

      t.integer :group_id
      t.index :group_id

      t.integer :theme_id
      t.index :theme_id

      t.json :last_post

      t.integer :posts_count, default: 0

      t.timestamps null: false
    end
  end
end
