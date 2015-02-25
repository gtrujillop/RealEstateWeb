class User < ActiveRecord::Base
	
	validates_presence_of :username, :first_name, :last_name
	validates :username, presence: true, length: { maximum: 12 }
	has_secure_password
	validates :password, presence: true, length: { minimum: 5 }, on: :create
	validates :birth_date, date: true
	validates :email, uniqueness: true, presence: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

	after_save :set_is_active

	has_many :user_roles
	has_many :roles, through: :user_roles

	def set_is_active
		self.update_column(:is_active, true)	
	end
	private :set_is_active
end
