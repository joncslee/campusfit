class Article < ActiveRecord::Base
  attr_accessible :content, :title, :article_type, :tags, :format, :image
  mount_uploader :image, ImageUploader

  def next
    Article.find(:first, :conditions => ["id > ?", self.id])
  end

  def previous
    Article.find(:first, :conditions => ["id < ?", self.id])
  end

  def save(*)

    # custom saving logic
    doc = Nokogiri::HTML(content)
    image_url = doc.css('img').first['src']

    if image_url
      require 'open-uri'
      self.image = open(image_url)
    end

    super

  end

end
