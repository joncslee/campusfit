class Article < ActiveRecord::Base
  attr_accessible :content, :title, :article_type, :tags, :format, :image
  mount_uploader :image, ImageUploader
  paginates_per 10 

  def next
    Article.find(:first, :conditions => ["id > ?", self.id])
  end

  def previous
    Article.find(:first, :conditions => ["id < ?", self.id])
  end

  def save(*)
    require 'open-uri'

    # don't overwrite saved thumbnails
    if self.image.blank?
      doc = Nokogiri::HTML(content)
      images = doc.css('img')

      if images.present?
        image_url = images.first['src']

        if image_url.present?
          begin
            temp = open(image_url)
            self.image = temp if temp.present?
          rescue Errno::ENOENT => e
            puts "Unable to open image: #{image_url}"
          rescue Timeout::Error => e
            puts "Request timed out"
          rescue TypeError => e
            puts "Error: #{e}"
          rescue OpenURI::HTTPError => e
            puts "Error: #{e}"
          end
        end
      end
    end

    super

  end

end
