class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content

      t.integer :user_id
      t.index :user_id
      
      t.integer :topic_id
      t.index :topic_id

      t.integer :theme_id
      t.index :theme_id

      t.boolean :delta, default: true

      t.timestamps null: false
    end
  end
end
