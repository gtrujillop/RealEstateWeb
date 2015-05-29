class PropertiesController < ApplicationController
  def index
    @user = LeaseHolder.find(params[:user_id])
    @properties = @user.properties
    if @properties.empty?
      flash[:error] = "No tiene propiedades registradas a la fecha."
      redirect_to user_path(@user.id)
    end
  end

  def new
    @property = Property.new
  end

  def show
    @property = Property.find(params[:id])
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = 'Propiedad registrada exitosamente.'
      redirect_to user_properties_path(current_user.id)
    else
      flash[:error] = @property.errors.full_messages.join(',')
      render 'new'
    end
  end

  def property_params
    params.require(:property).permit(:city, :neighbor, :location,
                                    :area, :building_name, :floors_number,
                                    :floor, :lease_holder_id, :short_description)
  end
end
