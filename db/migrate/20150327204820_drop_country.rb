class DropCountry < ActiveRecord::Migration
	def up
  	drop_table :countries
  end

  def down
    create_table :countries do |t|
      t.integer   "id",        limit: 255
	    t.string   "name",      limit: 255
	    t.string   "short_description",      limit: 255
    end
  end
end
