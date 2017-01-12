class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :model, null: false
      t.integer :manufacturer_id, null: false
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :milage, null: false
      t.text :description
    end
  end
end
