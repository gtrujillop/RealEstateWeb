class RemoveUserIdFromProperty < ActiveRecord::Migration
  def change
    remove_column :properties, :user_id, :integer
  end
end
