class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.timestamps
      t.string :value, null: false
    end

    add_index :addresses, :value, unique: true
  end
end
