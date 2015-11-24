class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
