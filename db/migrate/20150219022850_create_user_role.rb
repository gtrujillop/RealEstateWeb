class CreateUserRole < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.integer :user_id
      t.integer :role_id
    end
  end
end
