class Article < ActiveRecord::Base
  attr_accessible :content, :title, :article_type, :tags, :format
end
