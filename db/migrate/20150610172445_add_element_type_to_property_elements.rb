class AddElementTypeToPropertyElements < ActiveRecord::Migration
  def change
    add_reference :property_elements, :element_type, index: true
    add_foreign_key :property_elements, :element_types
  end
end
