class CompanyUser < ApplicationRecord
	belongs_to :user
	belongs_to :company
	has_many :general_expenses

	delegate :display_name, to: :user, prefix: true

	scope :not_deleted, -> { where(deleted: false) }
end
