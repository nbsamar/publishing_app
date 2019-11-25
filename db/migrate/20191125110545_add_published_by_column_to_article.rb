class AddPublishedByColumnToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :publishing_user_id, :integer
    add_column :articles, :unpublishing_user_id, :integer
  end
end
