class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  before_action :set_date_format, only: [:create, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = 'Bienvenido !'
			redirect_to login_path
		else
			flash[:error] = @user.errors.full_messages.join(',')
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, 
																 :birth_date, :email, 
																 :password, :password_confirmation, :type)	
	end

	def set_date_format
		formatted_date = (params['user']['birth_date']).to_date
		params['user'].merge(birth_date: formatted_date)
	end
	private :set_date_format
	
end