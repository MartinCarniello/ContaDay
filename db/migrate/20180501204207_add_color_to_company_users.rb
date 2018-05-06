class AddColorToCompanyUsers < ActiveRecord::Migration[5.2]
  def self.up
  	add_column :company_users, :color, :string
  end

  def self.down
  	remove_column :company_users, :color
  end
end
