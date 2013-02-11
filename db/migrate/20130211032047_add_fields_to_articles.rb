class AddFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_type, :string
    add_column :articles, :tags, :string
    add_column :articles, :format, :string
  end
end
