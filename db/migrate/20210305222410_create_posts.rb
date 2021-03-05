class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.text :text, null: false
    end
  end
end
