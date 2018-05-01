class AddCompanyUserRelationToGeneralExpenses < ActiveRecord::Migration[5.2]
  def self.up
  	add_column    :general_expenses, :company_user_id, :integer
  	remove_column :general_expenses, :user_id
  	remove_column :general_expenses, :company_id
  end

  def self.down
  	remove_column :general_expenses, :company_user_id
  	add_column :general_expenses, :user_id, :integer
  	add_column :general_expenses, :company_id, :integer
  end
end
