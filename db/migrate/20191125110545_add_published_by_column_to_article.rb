class AddPublishedByColumnToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :published_by, :integer
    add_column :articles, :unpublished_by, :integer
  end
end
