class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string  :delivery_postal_code
      t.string  :delivery_name
      t.string  :delivery_address
      t.integer :shiopping_cost, :default => 800
      t.integer :billing_amount
      t.integer :payment_method
      t.string :method_of_payment
      t.integer :is_deleted,:default => true
      t.timestamp :created_at,:default => Time.now
      t.timestamp :updated_at,:default => Time.now
    end
  end
end
