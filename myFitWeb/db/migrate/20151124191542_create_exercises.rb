class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :repetitions
      t.text :notes
      t.integer :workout_id

      t.timestamps null: false
    end
  end
end
