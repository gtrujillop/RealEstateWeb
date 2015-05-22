class OperationsController < ApplicationController
  skip_before_filter :require_login

	def new
		@operation = Operation.new
	end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      flash[:success] = 'Operación registrada exitosamente.'
      redirect_to user_property_operations_path(current_user.id, params[:property_id])
    else
      flash[:error] = @operation.errors.full_messages.join(',')
      render 'new'
    end
  end

end
