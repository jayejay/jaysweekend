class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :content
      t.text :title
      t.integer :user_id, foreign_key: {to_table: :users}, index: true
      t.timestamps
    end
  end
end
