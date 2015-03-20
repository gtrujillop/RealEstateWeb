class SessionsController < ApplicationController
	before_action :set_user, only: [:create]
  before_action :require_login, only: [:destroy]
  
  def new
  	@user = User.new
  end

  def create
		if @user  
		  redirect_back_or_to user_path(@user.id) , :notice => "Bienvenido !"  
		else
			flash[:error] = "Email o password erróneos."
			render :new
		end  	
  end

  def destroy
  	logout
  	redirect_to root_url, :notice => 'Adiós !'
  end

  def set_user
    @user = login(params[:email], params[:password])
  end
  private :set_user
  
  def session_params
    params.require(:user).permit(:email, :password)
  end
  private :session_params

end
