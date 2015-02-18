class AddIsActiveToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :is_active, :boolean
  end
end
