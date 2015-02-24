class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] == 'Bienvenido !'
			redirect_to @user
		else
			debugger
			flash[:error] == @user.errors.full_messages.join(',')
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, 
																 :birth_date, :email, 
																 :password, :password_confirmation)	
	end
	
end