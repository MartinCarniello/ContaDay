class GeneralReportsController < ApplicationController

  def report
    @companies = current_user.companies
    @companies_selected = @companies.select { |user_company| params[:company_ids].include?(user_company.id.to_s) }
    @user_total_cost = @companies_selected.map(&:general_expenses).flatten.sum(&:cost)
  end

end
