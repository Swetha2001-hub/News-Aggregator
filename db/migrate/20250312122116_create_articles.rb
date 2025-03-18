class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :category
      t.datetime :published_at

      t.timestamps
    end
  end
end
