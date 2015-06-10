class AddIsActiveToElementTypes < ActiveRecord::Migration
  def change
    add_column :element_types, :is_active, :boolean
  end
end
