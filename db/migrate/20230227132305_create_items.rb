class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name
      t.text :introduction
      t.integer :price
      t.integer :genre_id
      t.string :image_id
      t.boolean :is_active, default: true
      
      t.timestamps
    end
  end
end
