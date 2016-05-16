class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :title
      
      t.integer :group_id
      t.index :group_id

      t.integer :posts_count, default: 0
      t.integer :topics_count, default: 0

      t.json :last_post

      t.timestamps null: false
    end
  end
end
