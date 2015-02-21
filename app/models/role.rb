class Role < ActiveRecord::Base
	
	validates :name, presence: true, length: { maximum: 30 }
	validates :description, presence: true

	has_many :user_roles
	has_many :users, through: :user_roles

end