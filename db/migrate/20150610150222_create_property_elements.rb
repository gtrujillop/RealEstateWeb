class CreatePropertyElements < ActiveRecord::Migration
  def change
    create_table :property_elements do |t|
      t.string :name
      t.text :description
    end
  end
end
