class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :article_id, foreign_key: {to_table: :articles}, index: true
      t.integer :user_id, foreign_key: {to_table: :users}, index: true

      t.timestamps
    end
  end
end
