class PropertyElementsController < ApplicationController
  before_filter :check_for_cancel, :only => [:create]

  def index
    @user = current_user
    @property = Property.find(params[:property_id])
    @property_elements = @property.property_elements
    if @property_elements.empty?
      flash[:error] = "La propiedad no tiene elementos"
      redirect_to new_user_property_property_element_path(@user.id, @property.id)
    end
  end

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
    params.require(:property_element).permit(:name, :description, :image, :element_type_id, :property_id)
  end

  def check_for_cancel
    if(params.size == 5)
      flash[:notice] = "Registro cancelado."
      redirect_to user_property_property_elements_path(current_user.id, params[:property_id])
    end
  end
end
