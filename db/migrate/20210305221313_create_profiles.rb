class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.string :nickname, null: false
      t.string :first_name
      t.string :last_name
      t.string :description
    end

    add_index :profiles, :nickname, unique: true
  end
end
