class GeneralReportsController < ApplicationController

  def report
    @user_companies = current_user.companies
    @companies_selected = @user_companies.select { |user_company| (params[:company_ids] || @user_companies.map(&:id)).map(&:to_i).include?(user_company.id) }
    @user_total_cost = current_user.general_expenses.sum(&:cost)
  end

end
