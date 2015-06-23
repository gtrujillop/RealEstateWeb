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


  def show_all
    if params[:located_in] == '' && params[:latitude] != ''
      @properties ||= Property.near([params[:latitude], params[:longitude]], 1, units: :km)
                              .paginate(page: params[:page], per_page: 10)
    else
      @properties ||= Property.filter(params.slice(:for_sell, :located_in, :area_greater_than,
                                                   :area_lesser_than, :value_greather_than, :value_lesser_than))
                              .paginate(page: params[:page], per_page: 10)
    end
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
