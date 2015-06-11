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

end
