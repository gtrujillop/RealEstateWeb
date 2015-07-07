class PropertyPresenter
  attr_accessor :params
  def initialize(params)
    self.params = params
  end

  def filter_properties
    if basic_filter?
      find_all_properties
    elsif searching_by_map?
      filter_properties_by_coordinates
    else
      filter_properties_by_fields
    end
    paginate_results
  end

  def find_all_properties
    @properties ||= Property.all
  end
  private :find_all_properties

  def filter_properties_by_coordinates
    @properties ||= Property.near(coordinates_params, 2, units: :km)
  end
  private :filter_properties_by_coordinates

  def coordinates_params
    [params[:latitude], params[:longitude]]
  end
  private :coordinates_params

  def filter_properties_by_fields
    @properties ||= Property.filter(field_params)
  end
  private :filter_properties_by_fields

  def field_params
    params.slice(:for_sell, :located_in, :area_greater_than,
                  :area_lesser_than, :value_greather_than,
                  :value_lesser_than)
  end
  private :field_params

  def searching_by_map?
    return true if params[:located_in].blank? && params[:latitude] != ''
    false
  end
  private :searching_by_map?

  def basic_filter?
    return true if params[:located_in].nil? && params[:latitude].nil?
  end
  private :basic_filter?

  def paginate_results
    @properties.paginate(page: params[:page], per_page: 1)
  end
  private :paginate_results

end
