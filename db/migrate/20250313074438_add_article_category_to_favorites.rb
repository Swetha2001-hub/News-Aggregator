class AddArticleCategoryToFavorites < ActiveRecord::Migration[8.0]
  def change
    add_column :favorites, :article_category, :string
  end
end
