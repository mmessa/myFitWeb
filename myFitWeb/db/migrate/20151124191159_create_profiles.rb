class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.decimal :weight
      t.integer :feet
      t.integer :inches
      t.decimal :body_fat
      t.integer :age
      t.string :gender
      t.string :location
      t.string :gym
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
