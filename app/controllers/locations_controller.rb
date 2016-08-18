class LocationsController < ApplicationController
  def index
    @locations = Location.all
    if @locations.empty?
      flash[:error] = "No hay sitios de interés registrados a la fecha."
      redirect_to user_path(@user.id)
    end
  end

  def new
    if @current_user.is_admin?
      @location = Location.new
    else
      flash[:error] = "Acceso denegado."
      redirect_to user_path(@current_user.id)
    end
  end

  def import
    begin
      Location.transaction do
        @uploader = LocationUploader.new(location_params['locations_csv'].path)
        @uploader.import_locations
        unless @uploader.successful?
          raise ActiveRecord::Rollback, "No se pudo cargar el archivo, verifique los datos."
        end
      end
      #TODO redirect to locations index
      flash[:error] = "Elementos inválidos en el archivo, verifique."
      redirect_to new_location_path
    rescue
      flash[:error] = "Formato de archivo inválido, verifique que sea CSV."
      redirect_to new_location_path
    end
  end

  def location_params
    params.require(:location).permit(:locations_csv, :base_address, :city, :description)
  end
end
