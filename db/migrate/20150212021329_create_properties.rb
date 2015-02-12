class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.decimal :area
      t.string :building_name
      t.integer :floor
      t.integer :floors_number
      t.string :address
      t.text :short_description

      t.timestamps null: false
    end
  end
end
