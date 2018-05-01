class GeneralExpense < ApplicationRecord
	belongs_to :company_user
	has_one :user, through: :company_user
	has_one :company, through: :company_user

	validates :expense_name, :cost, :date_time, :company_user, presence: true
end
