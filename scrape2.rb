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

page.css('.esc-layout-article-cell').each do |story|
  title = story.at_css('.titletext').text
  body = story.at_css('.esc-lead-snippet-wrapper').text
  time = story.at_css('.al-attribution-timestamp').text
  image = page.at_css('.esc-thumbnail-image')['src']
  puts " Start||| Title: #{title} Body: #{body} Time: #{time} Image URL #{image} |||End"
end

