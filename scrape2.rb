require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'OpenSSL'

uri = URI.parse("https://news.google.com")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
@data = http.get(uri.request_uri)
page = Nokogiri.HTML(@data.body)

page.css('.esc-body').each do |story|

  title_url = story.at_css('.esc-lead-article-title a')['href']
  title = story.at_css('.titletext').text
  body = story.at_css('.esc-lead-snippet-wrapper').text
  time = story.at_css('.al-attribution-timestamp').text

  unless story.at_css('.esc-thumbnail-image').nil?
    image_url = story.at_css('.esc-thumbnail-image')['src']
  else
    image_url = "No image shown"
  end

  puts " Start||| Title_Url #{title_url} Title: #{title} Body: #{body} Time: #{time} Image URL #{image_url} |||End "

end
