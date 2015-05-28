class AddPropertyToOperations < ActiveRecord::Migration
  def change
    add_reference :operations, :property, index: true
    add_foreign_key :operations, :properties
  end
end
