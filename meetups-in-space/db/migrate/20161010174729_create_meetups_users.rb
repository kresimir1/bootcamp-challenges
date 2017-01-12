class CreateMeetupsUsers < ActiveRecord::Migration
  def change
    create_join_table :meetups, :users do |t|
      t.index [:meetup_id, :user_id]
    end
  end
end
