class PropertyElementPresenter

  def initialize(property_id)
    @property_id = property_id
  end

  def property
    @user_property ||= Property.find(@property_id)
  end

  def types_id_by_name
    if ElementType.all.any?
      @types ||= ElementType.all.each_with_object({}) do |memo, hsh|
        hsh[memo.name] = memo.id
      end
    else
      []
    end
  end

  def types_for_property
    @types_for_property ||= ElementType.all.each_with_object({}) do |type, hsh|
      hsh[type.name] = count_by_type(type.id)
    end
  end

  def glyphicon_for_type(type_name)
    case type_name
    when 'Baños' then 'glyphicon glyphicon-ok-circle'
    when 'Habitaciones' then 'glyphicon glyphicon-ok-circle'
    when 'Cocinas' then 'glyphicon glyphicon-cutlery'
    when 'Garages' then 'glyphicon glyphicon-car-rental'
    when 'Gimnasios' then 'glyphicon glyphicon-dumbbell'
    when 'Piscina' then 'glyphicon glyphicon-pool'
    else 'glyphicon glyphicon-home'
    end
  end

  def count_by_type(type_id)
    PropertyElement.where(property_id: property.id, element_type_id: type_id).count
  end
  private :count_by_type

end
