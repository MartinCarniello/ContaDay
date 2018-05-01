class AddDeletedToCompanyUser < ActiveRecord::Migration[5.2]
  def self.up
  	add_column :company_users, :deleted, :boolean, default: false
  end

  def self.down
  	remove_column :company_users, :deleted
  end
end
