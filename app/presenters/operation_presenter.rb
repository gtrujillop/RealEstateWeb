class OperationPresenter

  def initialize(user)
    @user = user
  end

  def user_properties
    @user_properties ||= Property.where(lease_holder_id: @user.id)
  end
end
