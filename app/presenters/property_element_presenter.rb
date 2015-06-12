class PropertyElementPresenter

  def initialize(property_id)
    @property_id = property_id
  end

  def property
    @user_property ||= Property.find(@property_id)
  end

  def types_by_id
    if ElementType.all.any?
      @types ||= ElementType.all.each_with_object({}) do |memo, hsh|
        hsh[memo.name] = memo.id
      end
    end
  end

  def types_for_property
    @types_for_property ||= property.property_elements.all.each_with_object({}) do |memo, hsh|
      hsh[type_name_for_element(memo)] = element_count_for_type(memo.id)
    end
  end

  def element_count_for_type(type_id)
    PropertyElement.where(element_type: type_id).count
  end
  private :element_count_for_type

  def type_name_for_element(element)
    ElementType.find(element.element_type_id).name
  end
  private :type_name_for_element

end
