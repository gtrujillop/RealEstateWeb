class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.text :short_description

      t.timestamps null: false
    end
  end
end
