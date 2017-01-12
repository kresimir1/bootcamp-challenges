class Recipe < ActiveRecord::Base
   validates :name, presence: true
   validates :name, format: { with: /(brussels sprouts)/i,
   message: "name must contain 'Brussels sprouts'" }
   validates :servings, numericality: { greater_than_or_equal_to: 1 }
   has_many :comments
end


class Comment < ActiveRecord::Base
   belongs_to :recipe
   validates :body, length: {maximum: 140}
   validates :recipe_id, presence: true
end


class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :name, null: false
      table.text :instructions, null: false
      table.integer :servings
      table.timestamps null: false
    end
  end
end



class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |table|
     table.integer :recipe_id, null: false
     table.text :body, null: false

     table.timestamps null: false
   end
  end
end
