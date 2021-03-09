class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.timestamps
      t.string :value, null: false
      t.boolean :added_to_wallet, null: false, default: false
      t.string :op_return_value
      t.datetime :op_return_checked_at
    end

    add_index :addresses, :value, unique: true
  end
end
