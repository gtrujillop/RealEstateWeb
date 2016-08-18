class CreateUserVisitAlerts < ActiveRecord::Migration
  def change
    create_table :user_visit_alerts do |t|
      t.references :user
      t.datetime :visit_date
      t.references :property
      t.integer :rate

      t.timestamps null: false
    end
  end
end
