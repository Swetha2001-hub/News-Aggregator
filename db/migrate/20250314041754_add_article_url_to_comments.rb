class AddArticleUrlToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :article_url, :string
  end
end
