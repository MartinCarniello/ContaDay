class GeneralReportsController < ApplicationController

  def report
    @user_companies = current_user.companies
    companies_selected_ids = (params[:companies_ids] || @user_companies.map(&:id)).map(&:to_i)
    @companies_selected = @user_companies.select { |user_company| companies_selected_ids.include?(user_company.id) }
    @user_total_cost = current_user.general_expenses.companies(companies_selected_ids).sum(&:cost)
  end

end
