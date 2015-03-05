class DropUsers < ActiveRecord::Migration
  def up
  	drop_table :users
  end

  def down
    create_table :users do |t|
      t.string   "username",        limit: 255
	    t.string   "dni_number",      limit: 255
	    t.string   "first_name",      limit: 255
	    t.string   "last_name",       limit: 255
	    t.string   "email",           limit: 255
	    t.string   "phone",           limit: 255
	    t.date     "birth_date"
	    t.datetime "created_at",      null: false
	    t.datetime "updated_at",      null: false
	    t.string   "password_digest", limit: 255
	    t.boolean  "is_active",       limit: 1
	    t.string   "type",            limit: 255
    end
  end
end
