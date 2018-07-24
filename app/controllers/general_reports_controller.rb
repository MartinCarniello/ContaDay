class GeneralReportsController < ApplicationController

  def report
    @user_companies = current_user.companies
    @companies_selected = @user_companies.select { |user_company| (params[:company_ids] || @user_companies.map(&:id)).map(&:to_i).include?(user_company.id) }
    @user_total_cost = @companies_selected.map(&:general_expenses).flatten.sum(&:cost)
  end

end
