class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |table|
      table.string :name, null: false
      table.text :description
      table.date :due_date
      table.integer :project_id, null: false
      table.integer :user_id
    end
  end
end
