require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'OpenSSL'

# Fetch and parse HTML document
# page = Nokogiri::HTML(open("http://www.bbc.com/"))

# # puts page.to_s.size

# # puts page.css('body').first.to_s.size

# css = 'span.mw-headline'

# page.css(css).each do |title|
#   puts title.text.strip
# end

uri = URI.parse("https://news.google.com")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
@data = http.get(uri.request_uri)
page = Nokogiri.HTML(@data.body)

page.css('h2.esc-lead-article-title').each do |title|
  puts title.content
end

page.css('.esc-lead-snippet-wrapper').each do |body|
  puts body.content
end

# page.css('.al-attribution-timestamp').each do |time|
#   puts time.content
# end

