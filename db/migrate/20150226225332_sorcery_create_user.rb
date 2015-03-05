class SorceryCreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string    :username,                      :null => false
      t.string    :first_name
      t.string    :last_name,											:null => false
      t.string    :identity
      t.string    :email,                         :null => false
      t.date      :birth_date
      t.boolean   :active,                        :default => false
      t.string    :type
			# Sorcery
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end