class AddProfileIdToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :profile_id, :integer
  end
end
