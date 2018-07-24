class GeneralReportsController < ApplicationController

  def report
    @user_companies = current_user.companies
    companies_selected_ids = (params[:companies_ids] || @user_companies.map(&:id)).map(&:to_i)
    @companies_selected = @user_companies.select { |user_company| companies_selected_ids.include?(user_company.id) }
    @general_expenses = current_user.general_expenses.companies(companies_selected_ids)
    @user_total_cost = @general_expenses.sum(&:cost)

    gon.grouped_general_expenses = @general_expenses.group(:expense_name).sum(:cost)
  end

end
