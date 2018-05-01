class CreateCompaniesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :company_users do |t|
    	t.belongs_to :user
    	t.belongs_to :company
    end
  end
end
