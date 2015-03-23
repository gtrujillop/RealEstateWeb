class PropertiesController < ApplicationController
	def index
		@user = LeaseHolder.find(params[:user_id])
		@properties = @user.properties
		if @properties.empty?
			flash[:error] = "No tiene propiedades registradas a la fecha."
			redirect_to user_path(@user.id)
		else
			render index
		end
	end
end