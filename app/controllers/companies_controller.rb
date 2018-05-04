class CompaniesController < ApplicationController
	def index
		@companies = Company.includes(company_users: :user).all
	end

	def edit
		@company = Company.find(params[:id])
		@company_users = @company.company_users
	end

	def update
		@company = current_user.companies.find_by(id: params[:id])

		if @company.update_attributes(company_params)
			flash[:notice] = "Información de la compañía guardada correctamente"
		else
			flash[:danger] = "Hubo un problema al guardar la compañía"
		end

		redirect_to edit_company_path(@company)
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
		@company = current_user.companies.find_by(id: params[:id])
		@company_user = @company.company_users.not_deleted.find_by(user_id: current_user.id)
		@general_expenses = @company.general_expenses.order_date_desc.page(params[:page])
		@new_general_expense = GeneralExpense.new(company_user: @company_user)
		gon.general_expenses_names = @company.general_expenses.distinct_names.map(&:expense_name)
	end

	private

	def company_params
		params.require(:company).permit(:name, :description, company_users_attributes: [:id, :color])
	end
end
