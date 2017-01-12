class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :manufacturer_name
      t.string :color
      t.integer :year
      t.integer :max_milage

      t.timestamps
    end
  end
end
