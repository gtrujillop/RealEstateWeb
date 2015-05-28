class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.decimal :payment
      t.date :start_date
      t.date :end_date
      t.string :duration
      t.boolean :status
      t.string :type
    end
  end
end
