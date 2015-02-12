class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :dni_number
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :birth_date

      t.timestamps null: false
    end
  end
end
