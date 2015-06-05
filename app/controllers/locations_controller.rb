class LocationsController < ApplicationController
  def index
    @locations = Location.all
    if @locations.empty?
      flash[:error] = "No hay sitios de interés registrados a la fecha."
      redirect_to user_path(@user.id)
    end
  end

  def new
    @location = Location.new
  end

  def import
    Location.transaction do
      @uploader = LocationUploader.new(location_params['locations_csv'].path)
      @uploader.import_locations
      unless @uploader.successful?
        raise ActiveRecord::Rollback, "No se pudo cargar el archivo, verifique los datos."
      end
    end
    #TODO redirect to locations index
    redirect_to user_path(current_user.id)
  end

  def location_params
    params.require(:location).permit(:locations_csv, :base_address, :city, :description)
  end
end
