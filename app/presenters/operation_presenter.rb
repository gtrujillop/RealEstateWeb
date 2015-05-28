class OperationPresenter

  def initialize(user)
    @user = user
  end

  def user_properties
    @user_properties ||= Property.where(lease_holder_id: @user.id)
  end

  def address_from_properties
    properties_by_id.to_a
  end

  def properties_by_id
    Hash[user_properties.pluck(:address, :id)]
  end
  private :properties_by_id
end
