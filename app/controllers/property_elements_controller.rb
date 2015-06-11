class PropertyElementsController < ApplicationController

  # def index
  #   @user = LeaseHolder.find(params[:user_id])
  #   @properties = @user.properties
  #   if @properties.empty?
  #     flash[:error] = "No tiene propiedades registradas a la fecha."
  #     redirect_to user_path(@user.id)
  #   end
  # end

  def new
    @property_element = PropertyElement.new
  end

  # def show
  #   @property = Property.find(params[:id])
  # end

  def create
    @property_element = PropertyElement.new(property_element_params)
    if @property_element.save
      flash[:success] = 'Elemento registrado exitosamente.'
      redirect_to user_property_property_elements_path(current_user.id, params[:property_id])
    else
      flash[:error] = @property_element.errors.full_messages.join(',')
      render 'new'
    end
  end

  def property_element_params
    params.require(:property_element).permit(:name, :description, :image, :element_type)
  end
end
