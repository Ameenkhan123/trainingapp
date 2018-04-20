class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    	drop_table :users
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.boolean :is_published?
      t.integer :user_id

      t.timestamps
    end
  end
end
