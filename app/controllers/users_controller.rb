class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	end

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, 
																 :birth_date, :email, 
																 :password, :password_confirmation)	
	end
	
end