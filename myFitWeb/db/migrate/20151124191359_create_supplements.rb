class CreateSupplements < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.string :name
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
