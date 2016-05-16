class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
