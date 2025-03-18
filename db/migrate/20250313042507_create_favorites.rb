class CreateFavorites < ActiveRecord::Migration[8.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.string :article_title
      t.string :article_url
      t.string :article_source

      t.timestamps
    end
  end
end
