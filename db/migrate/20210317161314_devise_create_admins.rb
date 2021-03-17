# frozen_string_literal: true

class DeviseCreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.integer :admin_id
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps :created_at
      t.timestamps :updated_at
      t.timestamps null: false
    end
    add_index :admins, :email,                unique: true
    add_index :admins, :reset_password_token, unique: true
  end
end
