class AddColorToCompanyUsers < ActiveRecord::Migration[5.2]
  def self.up
  	add_column :company_users, :bg_color, :string
  	add_column :company_users, :text_color, :string
  end

  def self.down
  	remove_column :company_users, :bg_color
  	remove_column :company_users, :text_color
  end
end
