class CreateGeneralExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :general_expenses do |t|
    	t.datetime   :date_time
    	t.float      :cost
    	t.string     :expense_name
    	t.string     :expense_description
    	t.belongs_to :user
    	t.belongs_to :company

      t.timestamps
    end
  end
end
