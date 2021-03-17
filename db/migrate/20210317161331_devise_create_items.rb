# frozen_string_literal: true

class DeviseCreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.integer :item_id
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :items, :email,                unique: true
    add_index :items, :reset_password_token, unique: true
  end
end
