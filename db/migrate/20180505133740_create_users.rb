class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :country
      t.string :currency
      t.string :country_code
      t.string :currency_code
      t.timestamps
    end
  end
end
