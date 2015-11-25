class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.decimal :weight
      t.text :notes

      t.timestamps null: false
    end
  end
end
