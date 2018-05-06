class AddColumnBankCodeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bank_code, :string
  end
end
