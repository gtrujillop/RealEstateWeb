class OperationsController < ApplicationController
  skip_before_filter :require_login

	def new
		@operation = Operation.new
    @presenter = OperationPresenter.new(current_user)
	end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      flash[:success] = 'Operación registrada exitosamente.'
      #TODO after the operation, redirect to show registered OP
      redirect_to user_properties_path(current_user.id)
    else
      flash[:error] = @operation.errors.full_messages.join(',')
      render 'new'
    end
  end

  def operation_params
    params.require(:operation).permit(:property_id, :user_id, :payment, :start_date, :end_date, :type)
  end
  private :operation_params

end
