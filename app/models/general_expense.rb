class GeneralExpense < ApplicationRecord
	belongs_to :company_user
	has_one :user, through: :company_user
	has_one :company, through: :company_user

	validates :expense_name, :cost, :date_time, :company_user, presence: true

	delegate :text_color, :bg_color, to: :company_user, prefix: true

	scope :order_date_desc, -> { order('date_time DESC') }
	scope :distinct_names, -> { select("DISTINCT expense_name") }
	scope :costs_by_users, -> { group("company_user_id").sum(:cost) }
  scope :companies, -> (companies_ids) { joins(:company).where('companies.id IN (?)', companies_ids) }
end
