class AddUserIdToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :user_id, :integer
  end
end
