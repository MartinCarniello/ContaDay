class Company < ApplicationRecord
	has_many :company_users
	has_many :general_expenses, through: :company_users
	has_many :users, through: :company_users

	validates :name, presence: true

	accepts_nested_attributes_for :company_users

	def is_member?(user)
		company_users.not_deleted.detect { |company_user| company_user.user_id == user.id }
	end
end
