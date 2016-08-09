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

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(property_params)
      flash[:success] = "Propiedad actualizada."
      redirect_to @property
    else
      render 'edit'
    end
  end

  def destroy
    @property = Property.find(params[:id])
    if @property.destroy
      flash[:success] = "Propiedad eliminada."
      redirect_to user_properties_path(current_user)
    else
      render 'show'
    end
  end

  def show_all
      
    @properties = PropertyPresenter.new(params).filter_properties
    if @properties.empty?
      flash.now[:error] = "No hay propiedades registradas que coincidan con esos criterios de búsqueda."
    end
  end

  def visit

    @visits = UserVisitAlert.all
    @property = Property.find(params[:property_id])
    @user_visit = UserVisitAlert.new(user_id: current_user.id, property_id: @property.lease_holder_id)
    if current_user.id != @property.lease_holder_id
      @user_visit.save
    end
  end

  def property_params
    params.require(:property).permit(:city, :value, :neighbor, :location, :address,
                                     :latitude, :longitude, :area, :building_name,
                                     :floors_number, :floor, :for_sell, :lease_holder_id,
                                     :short_description)
  end
end
