class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
