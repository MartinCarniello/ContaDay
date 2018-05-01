class CompaniesController < ApplicationController
	def index
		@companies = Company.includes(company_users: :user).all
	end

	def access
		@company = Company.find(params[:id])
		@company_user = @company.company_users.where(user_id: current_user.id).first_or_initialize
		@company_user.assign_attributes(deleted: false)
		@company_user.save!
		flash[:notice] = "Has ingresado a la compañía exitosamente"

		redirect_to companies_path
	end

	def quit
		@company = Company.find(params[:id])
		@company_user = @company.company_users.find_by(user_id: current_user.id)
		@company_user.update_attributes(deleted: true) if @company_user.present?
		flash[:notice] = "Has salido de la compañía exitosamente"

		redirect_to companies_path
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.create(company_params)
		@company.company_users.create(user_id: current_user.id)
		flash[:notice] = "Compañía creada exitosamente"

		redirect_to companies_path
	end

	def general_expenses
		@company = Company.find(params[:id])
		@company_user = @company.company_users.not_deleted.find_by(user_id: current_user.id)
		@general_expenses = @company.general_expenses
		@new_general_expense = GeneralExpense.new(company_user: @company_user)
	end

	private

	def company_params
		params.require(:company).permit(:name, :description)
	end
end
