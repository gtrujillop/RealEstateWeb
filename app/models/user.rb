class User < ActiveRecord::Base
	
	attr_accessor :password							 

	validates_presence_of :username, :first_name, :last_name

	has_secure_password
	validates :password, presence: true, length: { minimum: 5 }, on: :create

	validates :email, uniqueness: true, presence: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

end
