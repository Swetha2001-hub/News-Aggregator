class AddCategoryToFavorites < ActiveRecord::Migration[8.0]
  def change
    add_column :favorites, :category, :string
  end
end
