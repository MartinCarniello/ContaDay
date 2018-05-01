class Company < ApplicationRecord
	has_many :company_users
	has_many :general_expenses, through: :company_users

	def is_member?(user)
		company_users.not_deleted.detect { |company_user| company_user.user_id == user.id }
	end

	validates :name, :description, presence: true
end
