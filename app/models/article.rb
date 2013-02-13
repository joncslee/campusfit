class Article < ActiveRecord::Base
  attr_accessible :content, :title, :article_type, :tags, :format

  def next
    Article.find(:first, :conditions => ["id > ?", self.id])
  end

  def previous
    Article.find(:first, :conditions => ["id < ?", self.id])
  end

end
