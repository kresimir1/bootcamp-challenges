class CreateRestaurantCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_categories do |t|
      t.integer :restaurant_id, null: false
      t.integer :category_id, null: false
    end
  end
end
