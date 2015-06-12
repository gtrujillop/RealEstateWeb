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
    end
  end

  def types_for_property
    @types_for_property ||= ElementType.all.each_with_object({}) do |type, hsh|
      hsh[type.name] = PropertyElement.where(property_id: property.id, element_type_id: type.id).count
    end
  end

end
