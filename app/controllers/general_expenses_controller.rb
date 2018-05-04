class GeneralExpensesController < ApplicationController
	def create
		@company = current_user.companies.find_by(id: params[:general_expense][:company_id])
		@company_user = @company.company_users.not_deleted.find_by(user_id: current_user.id)
		@general_expense = GeneralExpense.create(general_expense_params.merge({company_user: @company_user}).merge({cost: general_expense_params[:cost].gsub(",", ".")}))

		redirect_to general_expenses_company_path(@company)
	end

	def edit
		@general_expense = GeneralExpense.find_by(id: params[:id])
		@company = @general_expense.company
		gon.general_expenses_names = @company.general_expenses.distinct_names.map(&:expense_name)

		if @company.is_member?(current_user)
			render "edit"
		else
			flash.now[:danger] = "No posee permisos para la operación solicitada"
			redirect_to root_path
		end
	end

	def update
		@general_expense = GeneralExpense.find_by(id: params[:id])
		@company = @general_expense.company
		gon.general_expenses_names = @company.general_expenses.distinct_names.map(&:expense_name)

		if @company.is_member?(current_user)
			if @general_expense.update_attributes(general_expense_params.merge({cost: general_expense_params[:cost].gsub(",", ".")}))
				flash.now[:notice] = "El gasto ha sido actualizado correctamente"
			else
				flash.now[:danger] = "Hubo un problema al querer actualizar el gasto"
			end

			render "edit"
		else
			flash.now[:danger] = "No posee permisos para la operación solicitada"
			redirect_to root_path
		end
	end

	def destroy
		@general_expense = GeneralExpense.find_by(id: params[:id])
		@company = @general_expense.company
		gon.general_expenses_names = @company.general_expenses.distinct_names.map(&:expense_name)

		if @company.is_member?(current_user)
			@general_expense.destroy
			flash[:notice] = "El gasto ha sido eliminado correctamente"
			redirect_to general_expenses_company_path(@company)
		else
			flash.now[:danger] = "No posee permisos para la operación solicitada"
			redirect_to root_path
		end
	end

	private

	def general_expense_params
		params.require(:general_expense).permit(:expense_name, :cost, :date_time, :expense_description)
	end
end
