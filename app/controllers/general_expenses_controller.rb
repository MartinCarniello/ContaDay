class GeneralExpensesController < ApplicationController
	def create
		@company = Company.find(params[:general_expense][:company_id])
		@company_user = @company.company_users.not_deleted.find_by(user_id: current_user.id)
		@general_expense = GeneralExpense.create(general_expense_params.merge({company_user: @company_user}).merge({cost: general_expense_params[:cost].gsub(",", ".")}))

		redirect_to general_expenses_company_path(@company)
	end

	private

	def general_expense_params
		params.require(:general_expense).permit(:expense_name, :cost, :date_time, :expense_description)
	end
end
