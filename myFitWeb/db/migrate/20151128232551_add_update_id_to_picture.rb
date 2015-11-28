class AddUpdateIdToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :update_id, :integer
  end
end
