class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string  :name
      t.string  :image_id
      t.text  :introduction
      t.integer :price
      t.boolean :is_active,:default => true
      t.timestamp :created_at,:default => Time.now
      t.timestamp :updated_at,:default => Time.now
    end
  end
end
