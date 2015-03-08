class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.birth_date = Date.strptime(params["#{user_type}"]['birth_date'], '%m/%d/%Y').to_date
		if @user.save
			flash[:success] = 'Registro exitoso, inicie sesión para continuar.'
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
		params.require(user_type.to_sym).permit(params["#{user_type}"].symbolize_keys.keys)
	end

	def user_type
		if params['user']
			'user'
		elsif params['lease_holder']
			'lease_holder'
		end		
	end
	private :user_type
	
end