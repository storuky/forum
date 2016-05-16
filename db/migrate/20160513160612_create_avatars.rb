class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :body
      t.timestamps null: false
    end
  end
end
