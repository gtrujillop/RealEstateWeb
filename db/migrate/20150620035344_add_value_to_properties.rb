class AddValueToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :value, :float
  end
end
