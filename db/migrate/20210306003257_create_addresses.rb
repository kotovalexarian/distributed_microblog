class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.timestamps
      t.string :value, null: false
      t.boolean :added_to_wallet, null: false, default: false
    end

    add_index :addresses, :value, unique: true
  end
end
