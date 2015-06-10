class AddValueToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :value_for_sell, :float
    add_column :properties, :value_for_rental, :float
  end
end
