desc 'Extract data from Campusfit RSS feed'
task :campusfit => :environment do
  
  require "open-uri"

  api_key = 'I88oPdxuhi3IDa9fZ5L6ztn31305M8jAEzf2QByNOQ1umxlwz4'
  offset = 0
  url = "http://api.tumblr.com/v2/blog/campusfit.tumblr.com/posts?api_key=#{api_key}&offset=#{offset}"

  json = JSON.parse(open(url).read)

  total_posts = json['response']['total_posts']


  total_photo = 0
  total_text = 0
  total_quote = 0
  total_link = 0
  total_answer = 0
  total_video = 0
  total_audio = 0
  total_chat = 0

  while (offset < total_posts)

    posts = json['response']['posts'].to_a
    posts.each do |post|
      slug = post['slug']
      type = post['type']

      if type == 'photo'
        total_photo = total_photo + 1
      elsif type == 'text'
        total_text = total_text + 1
      elsif type == 'quote'
        total_quote = total_quote + 1
      elsif type == 'link'
        total_link = total_link + 1
      elsif type == 'answer'
        total_answer = total_answer + 1
      elsif type == 'video'
        total_video = total_video + 1
      elsif type == 'audio'
        total_audio = total_audio + 1
      elsif type == 'chat'
        total_chat = total_chat + 1
      end

    end

    offset = offset + 20
    url = "http://api.tumblr.com/v2/blog/campusfit.tumblr.com/posts?api_key=#{api_key}&offset=#{offset}"
    json = JSON.parse(open(url).read)

  end

  puts "Total photo: #{total_photo}"
  puts "Total text: #{total_text}"
  puts "Total quote: #{total_quote}"
  puts "Total link: #{total_link}"
  puts "Total answer: #{total_answer}"
  puts "Total video: #{total_video}"
  puts "Total audio: #{total_audio}"
  puts "Total chat: #{total_chat}"




  # at end, response will be good, but 'posts' will contain 0

end
