class PropertiesController < ApplicationController
  skip_before_filter :require_login, :only => [:show_all, :visit]

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
  #TODO refactor this by using a presenter e.g PropertyPresenter
  def show_all
    @properties = PropertyPresenter.new(params).filter_properties
    if @properties.empty?
      flash.now[:error] = "No hay propiedades registradas que coincidan con esos criterios de búsqueda."
    end
  end

  def visit
    @property = Property.find(params[:property_id])
  end

  def property_params
    params.require(:property).permit(:city, :value, :operation_type, :neighbor, :location,
                                     :latitude, :longitude, :area, :building_name, :floors_number,
                                     :floor, :lease_holder_id, :short_description)
  end
end
