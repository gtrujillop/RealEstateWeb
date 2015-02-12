class CreateNeighbors < ActiveRecord::Migration
  def change
    create_table :neighbors do |t|
      t.string :name
      t.integer :stratus
      t.text :short_description

      t.timestamps null: false
    end
  end
end
