class AddPropertyToPropertyElements < ActiveRecord::Migration
  def change
    add_reference :property_elements, :property, index: true
    add_foreign_key :property_elements, :properties
  end
end
