# frozen_string_literal: true

class DeviseCreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :postal_code
      t.string :address
      t.string :telephone_number
      t.boolean :is_active,:default => true
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamp :created_at,:default => Time.now
      t.timestamp :updated_at,:default => Time.now
      t.timestamps null: false
    end
    add_index :customers, :email,                unique: true
    add_index :customers, :reset_password_token, unique: true
  end
end
