class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :nickname, null: false
      t.string :first_name
      t.string :last_name
      t.string :description
    end

    add_index :users, :nickname, unique: true
  end
end
