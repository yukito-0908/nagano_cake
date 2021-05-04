class Customer < ApplicationRecord
  def name
    self.last_name + self.first_name
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses,dependent: :destroy
end
