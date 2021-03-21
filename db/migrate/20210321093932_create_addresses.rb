class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :address_id
      t.integer :customer_id
      t.string  :name
      t.string  :postal_code
      t.string  :address
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamps
    end
  end
end
