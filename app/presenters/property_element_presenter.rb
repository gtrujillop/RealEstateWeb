class PropertyElementPresenter

  def initialize(property_id)
    @property_id = property_id
  end

  def property
    @user_property ||= Property.find(@property_id)
  end

  def types
    @types ||= ElementType.all.map(&:name)
  end

end
