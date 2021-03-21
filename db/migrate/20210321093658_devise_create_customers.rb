
class DeviseCreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.string  :last_name
      t.string  :first_name
      t.string  :last_name_kana
      t.string  :postal_code
      t.string  :address
      t.string  :telephone_number
      t.integer :customer_id
      t.boolean :is_deleted
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamps null: false
    end
    add_index :customers, :email,                unique: true
    add_index :customers, :reset_password_token, unique: true
  end
end
