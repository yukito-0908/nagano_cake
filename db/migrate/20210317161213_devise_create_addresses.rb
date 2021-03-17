
class DeviseCreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :address_id
      t.integer :customer_id
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
      t.timestamps :created_at
      t.timestamps :updated_at
    end
    add_index :addresses, :email,                unique: true
    add_index :addresses, :reset_password_token, unique: true
  end
end
