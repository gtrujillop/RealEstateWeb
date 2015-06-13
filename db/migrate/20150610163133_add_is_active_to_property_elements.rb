class AddIsActiveToPropertyElements < ActiveRecord::Migration
  def change
    add_column :property_elements, :is_active, :boolean
  end
end
